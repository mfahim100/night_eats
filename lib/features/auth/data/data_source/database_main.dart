import 'package:night_eats/features/auth/domain/entities/user_model.dart';

abstract class DatabaseMain {

  Future<String> registerUser(UserModel userModel);

  Future<String> signInUser(UserModel userModel);
  Future<String> forgotPasswordOfUser(UserModel userModel);
  Future<UserModel?> getUser();
  Future<String> updateUserPicture(UserModel userModel);
}