import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';
import 'package:night_eats/features/admin/main_admin/domain/repositories/admin_repository.dart';

import '../../../../auth/domain/entities/user_model.dart';


class AdminGetUserUseCase implements UseCase<UserModel, Params<String>>{

  final AdminRepository adminRepository;

  AdminGetUserUseCase({required this.adminRepository});
  @override
  Future<Either<Failure, UserModel>> call(params) async {
   return await adminRepository.getUser(params.data);
  }



}