
import '../../../client/domain/entities/client_order_model.dart';

abstract class DeliveryDatabaseMain{


  Future<List<ClientOrderModel>> deliveryGetAllOrders();
  Future<List<ClientOrderModel>> deliveryGetOnTheWayOrder();
  Future<List<ClientOrderModel>> deliveryGetRejectedOrder();
  Future<List<ClientOrderModel>> deliveryGetDeliveredOrders();
  // Future<String> updateOrder(ClientOrderModel model);


}