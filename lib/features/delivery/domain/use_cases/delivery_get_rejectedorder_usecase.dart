import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../../../../../core/utils/failure.dart';
import '../reposiries/delivery_repository.dart';

class DeliveryGetRejectedOrderUseCase implements UseCase{



  final DeliveryRepository deliveryRepository;

  DeliveryGetRejectedOrderUseCase({required this.deliveryRepository});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await deliveryRepository.deliveryGetRejectedOrder();
  }

}