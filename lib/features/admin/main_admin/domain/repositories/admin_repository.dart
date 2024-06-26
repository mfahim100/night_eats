

import 'package:dartz/dartz.dart';
import 'package:night_eats/features/admin/main_admin/domain/entities/item_model.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';

import '../../../../../core/utils/failure.dart';
import '../../../../auth/domain/entities/user_model.dart';

abstract class AdminRepository {

  Future<Either<Failure,bool>> addNewItem(ItemModel itemModel);
  Future<Either<Failure,List<ItemModel>>> getMyItem(String uid);
  Future<Either<Failure,bool>> deleteItem(ItemModel itemModel);
  Future<Either<Failure,bool>> updateItem(ItemModel itemModel);
  Future<Either<Failure,List<ClientOrderModel>>> getAllOrders();
  Future<Either<Failure,List<ClientOrderModel>>> getOnTheWayOrder();
  Future<Either<Failure,List<ClientOrderModel>>> getRejectedOrder();
  Future<Either<Failure,List<ClientOrderModel>>> getDeliveredOrders();
  Future<Either<Failure,bool>> updateStatus(ClientOrderModel model);
  Future<Either<Failure,UserModel>> getUser(String uid);
  Future<Either<Failure,List<UserModel>>> getAllDeliveryBoy();



}