
import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../entities/user_model.dart';
import '../repositries/auth_repository.dart';

class LoginUseCase implements UseCase<bool, Params<UserModel>>{


  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(Params params)async {
    return await authRepository.loginUser(params.data);
  }

}