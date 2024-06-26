import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../entities/user_model.dart';
import '../repositries/auth_repository.dart';

class GetUserUseCase implements UseCase<UserModel, Params<String>>{

  final AuthRepository authRepository;

  GetUserUseCase({required this.authRepository});
  @override
  Future<Either<Failure, UserModel>> call(params) async {
   return await authRepository.getUser();
  }



}