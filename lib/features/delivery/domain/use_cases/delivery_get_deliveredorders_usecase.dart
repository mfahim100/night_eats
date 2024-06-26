import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';
import 'package:night_eats/features/client/domain/repositries/client_repository.dart';
import 'package:night_eats/features/delivery/domain/reposiries/delivery_repository.dart';


class DeliveryGetDeliveredOrdersUseCase implements UseCase {




  final DeliveryRepository deliveryRepository;

  DeliveryGetDeliveredOrdersUseCase({required this.deliveryRepository});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await deliveryRepository.deliveryGetDeliveredOrders();
  }






}