import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../../client/domain/entities/client_order_model.dart';

abstract class DeliveryRepository{

  Future<Either<Failure,List<ClientOrderModel>>> deliveryGetAllOrders();
  Future<Either<Failure,List<ClientOrderModel>>> deliveryGetOnTheWayOrder();
  Future<Either<Failure,List<ClientOrderModel>>> deliveryGetRejectedOrder();
  Future<Either<Failure,List<ClientOrderModel>>> deliveryGetDeliveredOrders();
  // Future<Either<Failure,bool>> updateStatus(ClientOrderModel model);



}