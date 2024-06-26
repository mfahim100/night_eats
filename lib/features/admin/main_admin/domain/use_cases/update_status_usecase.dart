import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../../../../../core/utils/failure.dart';
import '../repositories/admin_repository.dart';

class UpdateStatusUseCase implements UseCase{



  final AdminRepository adminRepository;

  UpdateStatusUseCase({required this.adminRepository});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await adminRepository.updateStatus(params.data);
  }


}