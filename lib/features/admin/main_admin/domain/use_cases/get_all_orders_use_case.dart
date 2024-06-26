import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../repositories/admin_repository.dart';

class GetAllOrdersUseCase implements UseCase {



  final AdminRepository adminRepository;

  GetAllOrdersUseCase({required this.adminRepository});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await adminRepository.getAllOrders();
  }



}
