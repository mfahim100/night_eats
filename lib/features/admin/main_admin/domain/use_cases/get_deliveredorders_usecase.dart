import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../repositories/admin_repository.dart';

class GetDeliveredOrdersUseCase implements UseCase {




  final AdminRepository adminRepository;

  GetDeliveredOrdersUseCase({required this.adminRepository});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await adminRepository.getDeliveredOrders();
  }






}