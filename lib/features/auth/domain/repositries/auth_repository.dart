import 'package:dartz/dartz.dart';
import 'package:night_eats/features/auth/domain/entities/user_model.dart';
import '../../../../core/utils/failure.dart';


abstract class AuthRepository{


  Future<Either<Failure,bool>> registerUser(UserModel userModel);
  Future<Either<Failure,bool>> loginUser(UserModel userModel);
  Future<Either<Failure,bool>> forgotPassword(UserModel userModel);
  Future<Either<Failure,UserModel>> getUser();
  Future<Either<Failure,bool>> updateUserPicture(UserModel userModel);



}