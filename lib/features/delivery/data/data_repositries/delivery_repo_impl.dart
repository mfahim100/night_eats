import 'package:dartz/dartz.dart';
import 'package:night_eats/features/delivery/data/data_source/delivery_database_main.dart';
import 'package:night_eats/features/delivery/domain/reposiries/delivery_repository.dart';

import '../../../../core/utils/failure.dart';
import '../../../client/domain/entities/client_order_model.dart';

class DeliveryRepoImpl implements DeliveryRepository {



  DeliveryDatabaseMain deliveryDatabaseMain;

  DeliveryRepoImpl({required this.deliveryDatabaseMain});


  @override
  Future<Either<Failure, List<ClientOrderModel>>> deliveryGetAllOrders() async {
    List<ClientOrderModel>  allOrders= await  deliveryDatabaseMain.deliveryGetAllOrders();
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
  Future<Either<Failure, List<ClientOrderModel>>> deliveryGetOnTheWayOrder() async {
    List<ClientOrderModel>  allOrders= await  deliveryDatabaseMain.deliveryGetOnTheWayOrder();
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
  Future<Either<Failure, List<ClientOrderModel>>> deliveryGetRejectedOrder() async {
    List<ClientOrderModel>  allOrders= await  deliveryDatabaseMain.deliveryGetRejectedOrder();
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
  Future<Either<Failure, List<ClientOrderModel>>> deliveryGetDeliveredOrders() async  {

    List<ClientOrderModel>  allOrders= await  deliveryDatabaseMain.deliveryGetDeliveredOrders();
    if(allOrders != null){
      print("repo : ${allOrders.length}");
      return  Right(allOrders);
    }
    else {
      print('the eroor in getRejectedOrder in AdminRepoImpl is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }

  }




}