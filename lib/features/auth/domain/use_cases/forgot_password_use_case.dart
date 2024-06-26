import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../repositries/auth_repository.dart';

class ForgotPasswordUseCase implements UseCase{

  final AuthRepository authRepository;

  ForgotPasswordUseCase({required this.authRepository});

  @override
  Future<Either<Failure, dynamic>> call(params) async{
    return await authRepository.forgotPassword(params.data);

  }



}