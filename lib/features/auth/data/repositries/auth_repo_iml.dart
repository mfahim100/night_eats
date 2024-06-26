import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/features/auth/data/data_source/database_main.dart';
import 'package:night_eats/features/auth/domain/entities/user_model.dart';
import 'package:night_eats/features/auth/domain/repositries/auth_repository.dart';

class AuthRepoIml implements AuthRepository{


  DatabaseMain databaseMain;

  AuthRepoIml({required this.databaseMain});

  @override
  Future<Either<Failure, bool>> registerUser(UserModel userModel) async {
   String  isRegister= await  databaseMain.registerUser(userModel);
   if(isRegister=='Success'){
     return const Right(true);
   }
   else {
     return Left(Failure(message: isRegister));
   }
  }

  @override
  Future<Either<Failure, bool>> loginUser(UserModel userModel) async {
    String  isRegister= await  databaseMain.signInUser(userModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword(UserModel userModel)async {

    String  isRegister= await  databaseMain.forgotPasswordOfUser(userModel);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }





  @override
  Future<Either<Failure, UserModel>> getUser() async {

    UserModel?  user= await  databaseMain.getUser();
    if(user != null){
      print("repo");
      print(user.uid);
      return  Right(user);
    }
    else {
      print('the eroor in getting user is @@@@@@@@@@@@ ////////////@@@@@@ ');
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, bool>> updateUserPicture(UserModel model) async {
    String  isRegister= await  databaseMain.updateUserPicture(model);
    if(isRegister=='Success'){
      return const Right(true);
    }
    else {
      return Left(Failure(message: isRegister));
    }
  }






}