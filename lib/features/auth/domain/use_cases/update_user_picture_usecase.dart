import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/use_cases.dart';
import 'package:night_eats/features/auth/domain/repositries/auth_repository.dart';

import '../../../../core/utils/failure.dart';

class UpdateUserPictureUseCase implements UseCase{


  final AuthRepository authRepository;
  UpdateUserPictureUseCase({required this.authRepository});
  @override

  Future<Either<Failure, dynamic>> call(params) async {
    return await authRepository.updateUserPicture(params.data);

  }




}