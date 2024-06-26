import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:night_eats/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:night_eats/features/client/domain/entities/cart_model.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';
import 'package:night_eats/features/client/domain/use_cases/add_to_cart_usecase.dart';
import 'package:night_eats/features/client/domain/use_cases/client_get_all_cartdata_usecase.dart';
import 'package:night_eats/features/client/domain/use_cases/client_get_my_items_use_case.dart';
import 'package:night_eats/features/client/domain/use_cases/delete_cartdata_udecase.dart';
import '../../../../core/constants/custom_snakebar.dart';
import '../../../../core/utils/use_cases.dart';
import '../../../admin/main_admin/domain/entities/item_model.dart';
import '../../../auth/domain/entities/user_model.dart';
import '../../domain/use_cases/add_client_order_use_case.dart';
import '../../domain/use_cases/client_get_all_orders_use_case.dart';
import '../../domain/use_cases/client_get_deliveredorders_usecase.dart';
import '../../domain/use_cases/client_get_onthewayorder_usecase.dart';
import '../../domain/use_cases/client_get_rejectedorder_usecase.dart';

class ClientController extends GetxController{

  final AddClientOrderUseCase addClientController;
  final GetUserUseCase getUserUseCase;
  final ClientGetAllOrdersUseCase clientGetAllOrdersUseCase;
  final ClientGetOnTheWayOrderUseCase clientGetOnTheWayOrderUseCase;
  final ClientGetRejectedOrderUseCase clientGetRejectedOrderUseCase;
  final ClientGetDeliveredOrdersUseCase clientGetDeliveredOrdersUseCase;
  final ClientGetMyItemsUseCase clientGetMyItemsUseCase;
  final AddToCartUseCase addToCartUseCase;
  final ClientGetAllCartDataUseCase clientGetAllCartDataUseCase;
  final DeleteCartDataUseCase deleteCartDataUseCase;


  ClientController({
    required this.addClientController,
    required this.getUserUseCase,
    required this.clientGetAllOrdersUseCase,
    required this.clientGetOnTheWayOrderUseCase,
    required this.clientGetRejectedOrderUseCase,
    required this.clientGetDeliveredOrdersUseCase,
    required this.clientGetMyItemsUseCase,
    required this.addToCartUseCase,
    required this.clientGetAllCartDataUseCase,
    required this.deleteCartDataUseCase,
  });


  Future<void> loadClientData() async {
    await clientGetOnTheWayOrder();
    await clientGetDeliveredOrder();
    await clientGetAllOrders();
    await clientGetRejectedOrders();
    await clientGetMyItemsController();
    await getAllCartItemController();
    await getCurrentUser();
  }


    final clientFormKey = GlobalKey<FormState>();
    final clientContactUsFormKey = GlobalKey<FormState>();

  TextEditingController numberAndStreetController = TextEditingController();
  TextEditingController postalCodeAndCityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  clearController(){
    numberAndStreetController.clear();
    postalCodeAndCityController.clear();
    phoneNumberController.clear();
    messageController.clear();
  }


  String? validator(String? text) {
    if (text == null || text.isEmpty) {
      return 'The filed is required';
    }
    return null;
  }


  UserModel? currentUser;
  Future<UserModel?> getCurrentUser() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      String uid = FirebaseAuth.instance.currentUser!.uid;
      var results = await getUserUseCase(Params(uid));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in GetUser Function @@@@ is //////${e.message}');
        EasyLoading.dismiss();
      }, (b) {
        print("getCurrentUser controiller");
        print(b.uid);
        currentUser= b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
        EasyLoading.dismiss();
      });
    }
    return currentUser;
  }



  String generateReferralCode() {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    Random random = Random();
    String randomChars = '0123456789';
    String code = '';

    for (int i = 0; i < 6; i++) {
      code += randomChars[random.nextInt(randomChars.length)];
    }
    return userId.substring(0, 3).toUpperCase() + code;
  }



  RxBool isResultLoaded = false.obs;


  Future<void> addClientNewOrder(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String orderID =  generateReferralCode();
    getAllCartItemController();
    getTotalAmount();
    addTotalAmountOfAllProduct();

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();

      ClientOrderModel clientOrderModel = ClientOrderModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          email: currentUser!.email,
          orderId: orderID,
          name: '${currentUser!.firstName} ${currentUser!.lastName}',
          status: 0,
          lat: 0,
          long: 0,
          numberAndStreet: numberAndStreetController.text.trim(),
          postalCodeAndCity: postalCodeAndCityController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          date: DateTime.now().millisecondsSinceEpoch,
          listOfCardModel: getAllCartItem,
        totalAmountOfAllProduct: totalAmountOfAllProduct
      );
      if (clientFormKey.currentState!.validate()) {
        var results = await addClientController(Params(clientOrderModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in addClientNewOrder is //////${e.message}');

          EasyLoading.dismiss();
        }, (b) {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'Order Has been added', 'success');
          clearController();
          deleteCartDataController();
          ///GetMyOrderFunction
          EasyLoading.dismiss();
        });
      }
    }

  }




  List<ClientOrderModel> getAllOrdersList = [];
  Future<void> clientGetAllOrders() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getAllOrdersList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await clientGetAllOrdersUseCase(Params(uid));
      results.fold((e) {
        print('the error in client getAllOrders controller  is //////${e.message}');
        EasyLoading.dismiss();
      }, (b) {
        getAllOrdersList = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
      });
    }
  }


  List<ClientOrderModel> getOnTheWayOrderList = [];
  Future<void> clientGetOnTheWayOrder() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getOnTheWayOrderList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await clientGetOnTheWayOrderUseCase(Params(uid));
      results.fold((e) {
        print('the error in client getOnTheWayOrder controller  is //////${e.message}');
      }, (b) {
        getOnTheWayOrderList = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
        update();
      });
    }
  }


  List<ClientOrderModel> getRejectedOrdersList = [];

  Future<void> clientGetRejectedOrders() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getRejectedOrdersList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await clientGetRejectedOrderUseCase(Params(uid));
      results.fold((e) {
        print('the error in client getRejectedOrdersList controller  is //////${e
            .message}');
      }, (b) {
        getRejectedOrdersList = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;

      });
    }
  }

  List<ClientOrderModel> getDeliveredOrderList = [];

  Future<void> clientGetDeliveredOrder() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getDeliveredOrderList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await clientGetDeliveredOrdersUseCase(Params(uid));
      results.fold((e) {
        print('the error in  client getDeliveredOrderList controller  is //////${e.message}');
      }, (b) {
        getDeliveredOrderList = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
      });
    }
  }





  List<ItemModel> getMyItemList = [];

  Future<void> clientGetMyItemsController() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getMyItemList.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await clientGetMyItemsUseCase(Params(uid));
      results.fold((e) {
        print('the clientGetMyItemsController is bbbbbbbbbbbbbb//////${e.message}');
      }, (b) {
        getMyItemList = b;
        print('the clientGetMyItemsController is bbbbbbbbbbbbbb $b');
        print(getMyItemList);
        isResultLoaded.value = true;
        isResultLoaded.value = false;
      });
    }
  }







  double quantity = 1;
  Future<void> addToCartController(BuildContext context,ItemModel model) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      CartModel cartModel = CartModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        itemName: model.itemName,
        itemID: model.itemID,
        itemPrice: model.itemPrice,
        itemDescription: model.itemDescription,
        itemImage: model.itemImage,
        quantity: quantity.round(),
        total:int.parse( model.itemPrice!) * quantity.round()
      );
      var results = await addToCartUseCase(Params(cartModel));
      results.fold((e) {
        CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in addToCartController is //////${e.message}');
        EasyLoading.dismiss();


        quantity = 1;
      }, (b) {
        CustomSnakeBars.snakeBanner(
            context, 'Hello', 'Order Has been added to Cart', 'success');

        print('klkfsdjfsdklafsdjklfsdjklsfdkljfdskljfdskljfsdkljdfslkjfsdalkjsdflkjdfslkjdsf;klj Success');
        ///GetMyOrderFunction
        // deleteCartDataController();
        loadClientData();
        EasyLoading.dismiss();
      });
    }

  }



  List<CartModel> getAllCartItem = [];
  Future<void> getAllCartItemController() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    getAllCartItem.clear();
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    }
    else {
      var results = await clientGetAllCartDataUseCase(Params(uid));
      results.fold((e) {
        print('the getAllCartItemController is bbbbbbbbbbbbbb//////${e.message}');
      }, (b) {
        getAllCartItem = b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;

      });
    }
  }



  List<int> totalAmount = [];
  void getTotalAmount(){
    totalAmount.clear();
    for(var e in getAllCartItem){
      totalAmount.add(e.total!);
    }
    print(totalAmount);
  }

  int totalAmountOfAllProduct = 0;
  void addTotalAmountOfAllProduct(){
    totalAmountOfAllProduct = 0;
    for(var e in totalAmount){
      totalAmountOfAllProduct += e;
    }
    print(totalAmountOfAllProduct);
  }

  List<dynamic> cartModellll = [];
  void getCartModelList() {
    cartModellll.clear();
    for(var e in getAllOrdersList){
      cartModellll.add(e.listOfCardModel);
    }


  }




  Future<void> deleteCartDataController() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = '';
print("object");
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      var results = await deleteCartDataUseCase(Params(uid));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in deleteCartDataController is //////${e.message}');
        EasyLoading.dismiss();
        loadClientData();
      }, (b) {
        print('Soesdfsdjfsdjfklsdjflksdfksjdfkjsdfjsdfjlsdfjsdfjsldfjskdjfsdf');
        // CustomSnakeBars.snakeBanner(
        //     context, 'Hello', 'Order Has been added to Cart', 'success');
        ///GetMyOrderFunction
        EasyLoading.dismiss();
      });
    }

  }



  Future<void> deleteCurrentItemController(BuildContext context , CartModel cartModel) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      var results = await deleteCartDataUseCase(Params(cartModel));
      results.fold((e) {
        // CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in deleteCurrentItemController is //////${e.message}');
        EasyLoading.dismiss();
        loadClientData();
      }, (b) {
        CustomSnakeBars.snakeBanner(
            context, 'Hello', 'Order Has been deleted from Cart', 'success');
        ///GetMyOrderFunction
        EasyLoading.dismiss();
      });
    }

  }





}