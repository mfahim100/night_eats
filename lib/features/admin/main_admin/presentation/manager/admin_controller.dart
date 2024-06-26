import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:night_eats/features/admin/main_admin/domain/entities/item_model.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/add_new_item_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/delete_item_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_all_delivery_boy_usecase.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_all_orders_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_deliveredorders_usecase.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_my_items_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_onthewayorder_usecase.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_rejectedorder_usecase.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/update_item_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/update_status_usecase.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/constants/custom_snakebar.dart';
import '../../../../../core/utils/use_cases.dart';
import '../../../../auth/domain/entities/user_model.dart';
import '../../domain/use_cases/admin_get_user_use_case.dart';

class AdminController extends GetxController {


  final AddNewItemUseCase addNewItemUseCase;
  final GetMyItemsUseCase getMyItemsUseCase;
  final DeleteItemUseCase deleteItemUseCase;
  final UpdateItemUseCase updateItemUseCase;
  final GetAllOrdersUseCase getAllOrdersUseCase;
  final GetOnTheWayOrderUseCase getOnTheWayOrderUseCase;
  final GetRejectedOrderUseCase getRejectedOrderUseCase;
  final GetDeliveredOrdersUseCase getDeliveredOrdersUseCase;
  final UpdateStatusUseCase updateStatusUseCase;
  final AdminGetUserUseCase adminGetUserUseCase;
  final GetAllDeliveryBoyUseCase getAllDeliveryBoyUseCase;


  AdminController({
    required this.addNewItemUseCase,
    required this.getMyItemsUseCase,
    required this.deleteItemUseCase,
    required this.updateItemUseCase,
    required this.getAllOrdersUseCase,
    required this.getOnTheWayOrderUseCase,
    required this.getRejectedOrderUseCase,
    required this.getDeliveredOrdersUseCase,
    required this.updateStatusUseCase,
    required this.adminGetUserUseCase,
    required this.getAllDeliveryBoyUseCase,
  });


  Future<void> loadAdminData() async {
    print('klsfksjflkasjfsafjlsajfkjsafljaslkfjf');
    await getMyItemsController();
    await getAllOrders();
    await getOnTheWayOrder();
    await getRejectedOrders();
    await getDeliveredOrder();
    await getDeliveryBoysController();
  }


  var addNewItemFormKey = GlobalKey<FormState>();
  var updateFromKey = GlobalKey<FormState>();

  UserModel? currUser;

  TextEditingController addNewItemController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController itemDescription = TextEditingController();


  String? validator(String? text) {
    if (text == null || text.isEmpty) {
      return 'The filed is required';
    }
    return null;
  }


  clearController() {
    addNewItemController.clear();
    itemPriceController.clear();
    itemDescription.clear();
  }

  String itemImageUrl = '';

  Future<void> uploadItemPicture(BuildContext context) async {
    EasyLoading.show();
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print('Image File is ${file?.path}');
    if (file == null) return;
    Reference reference = FirebaseStorage.instance.ref()
        .child('ItemsImages')
        .child(addNewItemController.text.trim());
    try {
      Reference upload = reference;
      await upload.putFile(File(file.path));
      itemImageUrl = await upload.getDownloadURL();
      EasyLoading.dismiss();
      CustomSnakeBars.snakeBanner(
          context, 'Hello', 'Picture has been Uploaded', 'success');
      print('Image Url is $itemImageUrl');
    }
    catch (e) {
      print('error is $e');
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }


  Future<void> addNewItem(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String itemID = const Uuid().v1();

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      ItemModel itemModel = ItemModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          itemName: addNewItemController.text.trim(),
          itemPrice: itemPriceController.text.trim(),
          itemDescription: itemDescription.text.trim(),
          itemID: itemID,
          itemImage: itemImageUrl
      );
      if (addNewItemFormKey.currentState!.validate()) {
        var results = await addNewItemUseCase(Params(itemModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in addNewItem is //////${e.message}');

          EasyLoading.dismiss();
        }, (b) {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'Item Has been added', 'success');
          clearController();
          getMyItemsController();
          EasyLoading.dismiss();
        });
      }
    }
  }


  RxBool isResultLoaded = false.obs;
  List<ItemModel> getMyItemList = [];

  Future<void> getMyItemsController() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getMyItemList.clear();

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getMyItemsUseCase(Params(uid));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in getMyItemsController is //////${e.message}');
      }, (b) {
        getMyItemList = b;
        print(getMyItemList);
        getSlidingImages();
        isResultLoaded.value = true;
        isResultLoaded.value = false;

      });
    }
  }


  List<String> slidingImages = [];

  void getSlidingImages() {
    slidingImages.clear();
    for (var e in getMyItemList) {
      if (e.itemImage!.isNotEmpty) {
        slidingImages.add(e.itemImage!);
      }
    }
  }


  Future<void> deleteItem(BuildContext context, ItemModel itemModel) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      var results = await deleteItemUseCase(Params(itemModel));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in deleteItem is //////${e.message}');

        EasyLoading.dismiss();
      }, (b) {
        CustomSnakeBars.snakeBanner(
            context, 'Hello', 'Item Has been deleted', 'success');
        getMyItemsController();
        EasyLoading.dismiss();
      });
    }
  }


  void oldData(ItemModel itemModel) {
    addNewItemController.text = itemModel.itemName!;
    itemPriceController.text = itemModel.itemPrice!;
    itemDescription.text = itemModel.itemDescription!;
  }


  Future<void> updateItem(BuildContext context, ItemModel model) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      ItemModel itemModel = ItemModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          itemName: addNewItemController.text.trim(),
          itemPrice: itemPriceController.text.trim(),
          itemDescription: itemDescription.text.trim(),
          itemID: model.itemID,
          itemImage: itemImageUrl.isEmpty ? model.itemImage! : itemImageUrl
      );
      if (addNewItemFormKey.currentState!.validate()) {
        var results = await updateItemUseCase(Params(itemModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in updateItem is //////${e.message}');

          EasyLoading.dismiss();
        }, (b) {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'Item Has been updated', 'success');
          clearController();
          getMyItemsController();
          EasyLoading.dismiss();
        });
      }
    }
  }


  List<ClientOrderModel> getAllOrdersList = [];

  Future<void> getAllOrders() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getAllOrdersList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllOrdersUseCase(Params(uid));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in getAllOrders controller  is //////${e.message}');
        EasyLoading.dismiss();
      }, (b) {
        getAllOrdersList = b;
        print(getAllOrdersList);
        getSlidingImages();
        isResultLoaded.value = true;
        isResultLoaded.value = false;
      });
    }
  }


  List<ClientOrderModel> getOnTheWayOrderList = [];
  Future<void> getOnTheWayOrder() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getOnTheWayOrderList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getOnTheWayOrderUseCase(Params(uid));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in getOnTheWayOrder controller  is //////${e.message}');
      }, (b) {
        getOnTheWayOrderList = b;
        getSlidingImages();
        isResultLoaded.value = true;
        isResultLoaded.value = false;;
      });
    }
  }


  List<ClientOrderModel> getRejectedOrdersList = [];

  Future<void> getRejectedOrders() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getRejectedOrdersList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getRejectedOrderUseCase(Params(uid));
      results.fold((e) {
      }, (b) {
        getRejectedOrdersList = b;
        getSlidingImages();
        isResultLoaded.value = true;
        isResultLoaded.value = false;
      });
    }
  }

  List<ClientOrderModel> getDeliveredOrderList = [];

  Future<void> getDeliveredOrder() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getDeliveredOrderList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getDeliveredOrdersUseCase(Params(uid));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in getDeliveredOrderList controller  is //////${e
            .message}');
      }, (b) {
        getDeliveredOrderList = b;
        getSlidingImages();
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



  Rx<String>  assignTo = ''.obs;
  setTradeType(String val) {
    assignTo.value = val;
    print(assignTo);
    update();
  }
  Future<void> updateStatus(BuildContext context, String orderId,
      int status) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {

     Position pos=await _determinePosition();
      EasyLoading.show();
      ClientOrderModel clientOrderModel = ClientOrderModel(
          orderId: orderId,
          status: status,
          assignTo: assignTo.value,
          lat: pos.latitude,
          long: pos.longitude
      );
      var results = await updateStatusUseCase(Params(clientOrderModel));
      results.fold((e) {
        CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in updateStatus is //////${e.message}');
        EasyLoading.dismiss();
      }, (b) {
        CustomSnakeBars.snakeBanner(
            context, 'Hello', 'Item Has been updated', 'success');
        loadAdminData();
        EasyLoading.dismiss();
      });
    }
  }






Future<UserModel?> getCurrentUser(String uid) async {
  UserModel? mdl;
  final connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    print('check your connection');
  } else {
    var results = await adminGetUserUseCase(Params(uid));
    results.fold((e) {
      // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
      print('the error in GetUser  Function @@@@ is //////${e.message}');
    }, (b) {
      print(b.uid);
      mdl= b;
      currUser=b;
      isResultLoaded.value = true;
      isResultLoaded.value = false;
    });
  }
  return mdl;
}






  List<UserModel> getDeliveryBoysList = [];

  Future<void> getDeliveryBoysController() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getDeliveryBoysList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await getAllDeliveryBoyUseCase(Params(uid));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in getDeliveredOrderList controller  is //////${e
            .message}');
      }, (b) {
        getDeliveryBoysList = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
      });
      getAllDeliveryBoysList();
    }
  }

  List<String> allDeliveryBoys = [];
  getAllDeliveryBoysList() async {
    allDeliveryBoys.clear();
    for(var e in getDeliveryBoysList){
      allDeliveryBoys.add('${e.firstName} ${e.lastName}');
    }

    print('/./././../././././/././././././. All Delivery Boys List is $allDeliveryBoys');



  }

  openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    bool isLaunchUrl=await canLaunchUrl(Uri.parse(googleUrl));
    print(isLaunchUrl);
    if (isLaunchUrl) {
    await launchUrl(Uri.parse(googleUrl));
    } else {
      await launchUrl(Uri.parse(googleUrl));
    throw 'Could not open the map.';
    }
  }








}