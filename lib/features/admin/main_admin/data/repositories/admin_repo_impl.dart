import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/features/admin/main_admin/domain/entities/item_model.dart';
import 'package:night_eats/features/admin/main_admin/domain/repositories/admin_repository.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';

import '../../../../auth/domain/entities/user_model.dart';
import '../data_sources/admin_database_main.dart';

class AdminRepoImpl implements AdminRepository{



  AdminDatabaseMain adminDatabaseMain;

  AdminRepoImpl({required this.adminDatabaseMain});

  @override
  Future<Either<Failure, bool>> addNewItem(ItemModel itemModel) async {
    String  isRegister= await  adminDatabaseMain.insertNewItem(itemModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }

  @override
  Future<Either<Failure, List<ItemModel>>> getMyItem(String uid) async  {
    List<ItemModel>  items= await  adminDatabaseMain.getMyItems(uid);
    if(items != null){
      print("repo : ${items.length}");
      return  Right(items);
    }
    else {
      print('the eroor in getMyItem in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }


  @override
  Future<Either<Failure, bool>> deleteItem(ItemModel itemModel)async {
    String  isRegister= await  adminDatabaseMain.deleteItem(itemModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }


  @override
  Future<Either<Failure, bool>> updateItem(ItemModel itemModel) async {
    String  isRegister= await  adminDatabaseMain.updateItem(itemModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }


  @override
  Future<Either<Failure, List<ClientOrderModel>>> getAllOrders() async {
    List<ClientOrderModel>  allOrders= await  adminDatabaseMain.getAllOrders();
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
  Future<Either<Failure, List<ClientOrderModel>>> getOnTheWayOrder() async {
    List<ClientOrderModel>  allOrders= await  adminDatabaseMain.getOnTheWayOrder();
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
  Future<Either<Failure, List<ClientOrderModel>>> getRejectedOrder() async {
    List<ClientOrderModel>  allOrders= await  adminDatabaseMain.getRejectedOrder();
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
  Future<Either<Failure, List<ClientOrderModel>>> getDeliveredOrders() async  {

    List<ClientOrderModel>  allOrders= await  adminDatabaseMain.getDeliveredOrders();
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
  Future<Either<Failure, bool>> updateStatus(ClientOrderModel model)async {
    String  isRegister= await  adminDatabaseMain.updateOrder(model);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }


  @override
  Future<Either<Failure, UserModel>> getUser(String uid) async {

    UserModel?  user= await  adminDatabaseMain.getUser(uid);
    if(user != null){
      print("repo");
      print(user.uid);
      return  Right(user);
    }
    else {
      print('the eroor in getting user is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getAllDeliveryBoy() async {
    List<UserModel>  allDeliveryBoys= await  adminDatabaseMain.getAllDeliveryBoys();
    if(allDeliveryBoys != null){
      print("repo : ${allDeliveryBoys.length}");
      return  Right(allDeliveryBoys);
    }
    else {
      print('the eroor in getAllDeliveryBoy in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }

  }










}