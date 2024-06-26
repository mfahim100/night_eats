import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../../../../../core/utils/failure.dart';
import '../reposiries/delivery_repository.dart';

class DeliveryGetOnTheWayOrderUseCase implements UseCase{


  final DeliveryRepository deliveryRepository;

  DeliveryGetOnTheWayOrderUseCase({required this.deliveryRepository});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await deliveryRepository.deliveryGetOnTheWayOrder();
  }





}