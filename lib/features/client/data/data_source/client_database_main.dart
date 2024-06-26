import 'package:night_eats/features/client/domain/entities/cart_model.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';

import '../../../admin/main_admin/domain/entities/item_model.dart';

abstract class ClientDatabaseMain {


  Future<String> addClientNewOrder(ClientOrderModel clientOrderModel);
  Future<List<ClientOrderModel>> clientGetAllOrders();
  Future<List<ClientOrderModel>> clientGetOnTheWayOrder();
  Future<List<ClientOrderModel>> clientGetRejectedOrder();
  Future<List<ClientOrderModel>> clientGetDeliveredOrders();
  Future<List<ItemModel>> clientGetMyItem(String uid);
  Future<String> addToCart(CartModel cartModel);
  Future<List<CartModel>> clientGetAllCartData();
  Future<String> deleteCartData();
  Future<String> deleteCurrentItem(CartModel cartModel);

}