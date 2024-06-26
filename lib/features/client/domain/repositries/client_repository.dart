import 'package:dartz/dartz.dart';
import 'package:night_eats/features/client/domain/entities/cart_model.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';

import '../../../../core/utils/failure.dart';
import '../../../admin/main_admin/domain/entities/item_model.dart';

abstract class ClientRepository {

  Future<Either<Failure,bool>> addClientOrder(ClientOrderModel userModel);
  Future<Either<Failure,List<ClientOrderModel>>> clientGetAllOrders();
  Future<Either<Failure,List<ClientOrderModel>>> clientGetOnTheWayOrder();
  Future<Either<Failure,List<ClientOrderModel>>> clientGetRejectedOrder();
  Future<Either<Failure,List<ClientOrderModel>>> clientGetDeliveredOrders();
  Future<Either<Failure,List<ItemModel>>> clientGetMyItem(String uid);
  Future<Either<Failure,bool>> addToCart(CartModel cartModel);
  Future<Either<Failure,List<CartModel>>> clientGetAllCartData();
  Future<Either<Failure,bool>> deleteCartData();
  Future<Either<Failure,bool>> deleteCurrentItem(CartModel cartModel);

}
