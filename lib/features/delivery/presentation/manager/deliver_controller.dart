import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:night_eats/features/auth/presentation/manager/auth_controller.dart';
import '../../../../core/constants/custom_snakebar.dart';
import '../../../../core/utils/injections.dart';
import '../../../../core/utils/use_cases.dart';
import '../../../admin/main_admin/domain/use_cases/update_status_usecase.dart';
import '../../../admin/main_admin/presentation/manager/admin_controller.dart';
import '../../../client/domain/entities/client_order_model.dart';
import '../../domain/use_cases/delivery_get_all_orders_use_case.dart';
import '../../domain/use_cases/delivery_get_deliveredorders_usecase.dart';
import '../../domain/use_cases/delivery_get_onthewayorder_usecase.dart';
import '../../domain/use_cases/delivery_get_rejectedorder_usecase.dart';

class DeliveryController extends GetxController{


  RxBool isResultLoaded = false.obs;

  final DeliveryGetAllOrdersUseCase getAllOrdersUseCase;
  final DeliveryGetOnTheWayOrderUseCase getOnTheWayOrderUseCase;
  final DeliveryGetRejectedOrderUseCase getRejectedOrderUseCase;
  final DeliveryGetDeliveredOrdersUseCase getDeliveredOrdersUseCase;
  final UpdateStatusUseCase updateStatusUseCase;


  DeliveryController({
    required this.getAllOrdersUseCase,
    required this.getOnTheWayOrderUseCase,
    required this.getRejectedOrderUseCase,
    required this.getDeliveredOrdersUseCase,
    required this.updateStatusUseCase,
});


  loadDeliveryData() async {
    await deliveryGetAllOrders();
    await deliveryGetOnTheWayOrder();
    await deliveryGetRejectedOrders();
    await deliveryGetDeliveredOrder();
  }


  List<ClientOrderModel> getAllOrdersList = [];

  Future<void> deliveryGetAllOrders() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getAllOrdersList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllOrdersUseCase(Params(uid));
      results.fold((e) {
        print('the error in getAllOrders controller  is //////${e.message}');
        EasyLoading.dismiss();
      }, (b) {
        getAllOrdersList = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
      });
    }
  }



  List<ClientOrderModel> getOnTheWayOrderList = [];
  Future<void> deliveryGetOnTheWayOrder() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getOnTheWayOrderList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getOnTheWayOrderUseCase(Params(uid));
      results.fold((e) {
        print('the error in getOnTheWayOrder controller  is //////${e.message}');
      }, (b) {
        getOnTheWayOrderList = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
      });
    }
  }




  List<ClientOrderModel> getRejectedOrdersList = [];
  Future<void> deliveryGetRejectedOrders() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getRejectedOrdersList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getRejectedOrderUseCase(Params(uid));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in getRejectedOrdersList controller  is //////${e.message}');
      }, (b) {
        getRejectedOrdersList = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
      });
    }
  }

  List<ClientOrderModel> getDeliveredOrderList = [];

  Future<void> deliveryGetDeliveredOrder() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getDeliveredOrderList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getDeliveredOrdersUseCase(Params(uid));
      results.fold((e) {
        print('the error in getDeliveredOrderList controller  is //////${e
            .message}');
      }, (b) {
        getDeliveredOrderList = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;

      });
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }



  Future<void> updateStatus(BuildContext context, String orderId,
      int status) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    Position pos = await _determinePosition();

    final userController= sl<AuthController>();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');

    } else {
      EasyLoading.show();
      ClientOrderModel clientOrderModel = ClientOrderModel(
          orderId: orderId,
          status: status,
          assignTo: '${userController.currUser!.firstName} ${userController.currUser!.lastName}',
          lat: pos.longitude,
          long: pos.latitude,
      );
      var results = await updateStatusUseCase(Params(clientOrderModel));
      results.fold((e) {
        CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in updateStatus is //////${e.message}');
        EasyLoading.dismiss();
      }, (b) {
        CustomSnakeBars.snakeBanner(
            context, 'Hello', 'Item Has been updated', 'success');
        loadDeliveryData();
        sl<AdminController>().loadAdminData();
        EasyLoading.dismiss();
      });
    }
  }





}