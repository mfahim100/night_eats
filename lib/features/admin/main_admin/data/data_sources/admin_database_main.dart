

import 'package:night_eats/features/admin/main_admin/domain/entities/item_model.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';

import '../../../../auth/domain/entities/user_model.dart';

abstract class AdminDatabaseMain {

  Future<String> insertNewItem(ItemModel itemModel);
  Future<List<ItemModel>> getMyItems(String uid);
  Future<String> deleteItem(ItemModel itemModel);
  Future<String> updateItem(ItemModel itemModel);
  Future<List<ClientOrderModel>> getAllOrders();
  Future<List<ClientOrderModel>> getOnTheWayOrder();
  Future<List<ClientOrderModel>> getRejectedOrder();
  Future<List<ClientOrderModel>> getDeliveredOrders();
  Future<String> updateOrder(ClientOrderModel model);
  Future<UserModel?> getUser(String uid);
  Future<List<UserModel>> getAllDeliveryBoys();








}