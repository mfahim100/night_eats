import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/features/client/domain/entities/cart_model.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';
import 'package:night_eats/features/client/domain/repositries/client_repository.dart';

import '../../../admin/main_admin/domain/entities/item_model.dart';
import '../data_source/client_database_main.dart';

class ClientRepoImpl implements ClientRepository {

  ClientDatabaseMain clientDatabaseMain;

  ClientRepoImpl({
    required this.clientDatabaseMain
});


  @override
  Future<Either<Failure, bool>> addClientOrder(ClientOrderModel clientOrderModel) async {
    String  isRegister=  await  clientDatabaseMain.addClientNewOrder(clientOrderModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }


  @override
  Future<Either<Failure, List<ClientOrderModel>>> clientGetAllOrders() async {
    List<ClientOrderModel>  allOrders= await  clientDatabaseMain.clientGetAllOrders();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the eroor in getAllOrders in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }


  @override
  Future<Either<Failure, List<ClientOrderModel>>> clientGetOnTheWayOrder() async {
    List<ClientOrderModel>  allOrders= await  clientDatabaseMain.clientGetOnTheWayOrder();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the eroor in getOnTheWayOrder in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }


  @override
  Future<Either<Failure, List<ClientOrderModel>>> clientGetRejectedOrder() async {
    List<ClientOrderModel>  allOrders= await  clientDatabaseMain.clientGetRejectedOrder();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the eroor in getRejectedOrder in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }



  @override
  Future<Either<Failure, List<ClientOrderModel>>> clientGetDeliveredOrders() async  {

    List<ClientOrderModel>  allOrders= await  clientDatabaseMain.clientGetDeliveredOrders();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the eroor in getRejectedOrder in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }


  }


  @override
  Future<Either<Failure, List<ItemModel>>> clientGetMyItem(String uid) async  {
    List<ItemModel>  items= await  clientDatabaseMain.clientGetMyItem(uid);
    if(items != null){
      print("repo : ${items.length}");
      return  Right(items);
    }
    else {
      print('the error in ClientItem in clientGetMyItem is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }


  @override
  Future<Either<Failure, bool>> addToCart(CartModel cartModel)async  {
    String  isRegister=  await  clientDatabaseMain.addToCart(cartModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> clientGetAllCartData() async {
    List<CartModel>  allOrders= await  clientDatabaseMain.clientGetAllCartData();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the eroor in clientGetAllCartData in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }

  }

  @override
  Future<Either<Failure, bool>> deleteCartData()async {
    // print(object);
    String  isRegister=  await  clientDatabaseMain.deleteCartData();
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCurrentItem(CartModel cartModel)async  {
    String  isRegister=  await  clientDatabaseMain.addToCart(cartModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }






}