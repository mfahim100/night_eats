import 'package:dartz/dartz.dart';
import 'package:night_eats/features/auth/domain/entities/user_model.dart';

import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_cases.dart';
import '../repositries/auth_repository.dart';

class RegisterUserUseCase implements UseCase<bool, Params<UserModel>> {
  final AuthRepository repository;

  RegisterUserUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.registerUser(params.data);
  }


}
