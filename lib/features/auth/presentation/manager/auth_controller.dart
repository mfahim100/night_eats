import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:night_eats/core/constants/custom_snakebar.dart';
import 'package:night_eats/features/admin/main_admin/presentation/manager/admin_controller.dart';
import 'package:night_eats/features/admin/main_admin/presentation/pages/admin_home_screen.dart';
import 'package:night_eats/features/auth/domain/entities/user_model.dart';
import 'package:night_eats/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:night_eats/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:night_eats/features/auth/domain/use_cases/login_use_case.dart';
import 'package:night_eats/features/auth/domain/use_cases/update_user_picture_usecase.dart';
import 'package:night_eats/features/client/presentation/manager/client_controller.dart';
import 'package:night_eats/features/client/presentation/pages/client_home_screen.dart';
import 'package:night_eats/features/delivery/presentation/manager/deliver_controller.dart';
import 'package:night_eats/features/delivery/presentation/pages/delivery_home_screen.dart';
import '../../../../core/utils/injections.dart';
import '../../../../core/utils/use_cases.dart';
import '../../domain/use_cases/register_use_case.dart';

class AuthController extends GetxController {
  final RegisterUserUseCase registerUserUseCase;
  final GetUserUseCase getUserUseCase;
  final LoginUseCase loginUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final UpdateUserPictureUseCase updateUserPictureUseCase;

  // final LoginUseCase loginUseCase;

  AuthController({
    required this.getUserUseCase,
    required this.registerUserUseCase,
    required this.loginUseCase,
    required this.forgotPasswordUseCase,
    required this.updateUserPictureUseCase,
  });

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  TextEditingController signUpFirstNameController = TextEditingController();
  TextEditingController signUpLastNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpNumberAndStreetController =
      TextEditingController();
  TextEditingController signUpPostalCodeAndCityController =
      TextEditingController();
  TextEditingController signUpMobileNumberController = TextEditingController();

  /// SignIn Controllerssss///

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  ///Forgot Password
  TextEditingController forgotPasswordEmailController = TextEditingController();

  String? validateFirstNameField(String? text) {
    if (text == null || text.isEmpty) {
      return 'First Name is required';
    }
    return null;
  }

  String? validateLastNameField(String? text) {
    if (text == null || text.isEmpty) {
      return 'Last Name is required';
    }
    return null;
  }

  String? validateEmailField(String? text) {
    String pattern =
        r"^[a-zA-Z0-9_.]+@(gmail|yahoo|outlook|apple|hotmail|mailbox|aim).com$";
    RegExp regex = RegExp(pattern);

    if (text!.isEmpty) {
      return "Email is empty";
    } else if (!regex.hasMatch(text)) {
      return 'Enter a Valid Email Address ';
    }
    return null;
  }

  String? validatePasswordField(String? text) {
    if (text == null || text.isEmpty) {
      return 'Password is required';
    } else if (text.length < 8) {
      return 'Password must be 8 words';
    }
    return null;
  }

  String? validateNumberAndStreetField(String? text) {
    if (text == null || text.isEmpty) {
      return 'Number And Street is required';
    }
    return null;
  }

  String? validatePostalCodeAndCityField(String? text) {
    if (text == null || text.isEmpty) {
      return 'Postal Code And City is required';
    }
    return null;
  }

  String? validateMobileNumberField(String? text) {
    if (text == null || text.isEmpty) {
      return 'Postal Code And City is required';
    }
    return null;
  }




  Future<void> signUpSubmit(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      UserModel userModel = UserModel(
          uid: "",
          firstName: signUpFirstNameController.text.trim(),
          lastName: signUpLastNameController.text.trim(),
          email: signUpEmailController.text.trim(),
          password: signUpPasswordController.text.trim(),
          numberAndStreet: signUpNumberAndStreetController.text.trim(),
          postalCodeAndCity: signUpPostalCodeAndCityController.text.trim(),
          mobileNumber: signUpMobileNumberController.text.trim(),
          role: 'client',
        imgUrl: ''

      );
      if (signUpFormKey.currentState!.validate()) {
        var results = await registerUserUseCase(Params(userModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in signup Submit is //////${e.message}');

          EasyLoading.dismiss();
        }, (b) {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'You account has been created', 'success');
          Get.offAll(ClientHomeScreen());
          EasyLoading.dismiss();
        });
      }
    }
  }

  Future<void> signInSubmit(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      GetStorage().write("email", signInEmailController.text);
      GetStorage().write("pass", signInPasswordController.text);
      UserModel userModel = UserModel(
        email: signInEmailController.text.trim(),
        password: signInPasswordController.text.trim(),
      );
      if (signInFormKey.currentState!.validate()) {
        var results = await loginUseCase(Params(userModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in signiIN Submit is //////${e.message}');
          EasyLoading.dismiss();
        }, (b) async {
        await getCurrentUser();
        await sl<AdminController>().loadAdminData();
        await sl<ClientController>().loadClientData();
        await sl<DeliveryController>().loadDeliveryData();
          });
      }
    }
  }



  RxBool isResultLoaded = false.obs;

  UserModel? currUser;
  Future<UserModel?> getCurrentUser() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    String uid = FirebaseAuth.instance.currentUser!.uid;
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      var results = await getUserUseCase(Params(uid));
      results.fold((e) {
      }, (b) {
        currUser= b;
        isResultLoaded.value = true;
        isResultLoaded.value = false;
        if(currUser != null){
          if(currUser!.role == "admin"){
            Get.offAll(const AdminHomeScreen());
          }
          else if(currUser!.role == 'client'){
            Get.offAll( ClientHomeScreen());
          }
          else{
            Get.offAll( const DeliveryHomeScreen());
          }
        }
        else{
          print("model is null");
        }
      });
    }
    return currUser;
  }


  Future<void> forgotPasswordSubmit(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      UserModel userModel = UserModel(
        email: forgotPasswordEmailController.text.trim(),
      );
      print('name = ${userModel.email}');
      if (forgotPasswordFormKey.currentState!.validate()) {
        var results = await forgotPasswordUseCase(Params(userModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in Forgot Password  Submit is //////${e.message}');
          EasyLoading.dismiss();
        }, (b) {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'Mail Has been sent', 'success');
          EasyLoading.dismiss();
        });
      }
    }
  }



  Future<void> addNewDeliveryBoy(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      UserModel userModel = UserModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          firstName: signUpFirstNameController.text.trim(),
          lastName: signUpLastNameController.text.trim(),
          email: signUpEmailController.text.trim(),
          password: signUpPasswordController.text.trim(),
          numberAndStreet: '',
          postalCodeAndCity: '',
          mobileNumber: '',
          role: 'delivery',
          imgUrl: ''

      );
      if (signUpFormKey.currentState!.validate()) {
        var results = await registerUserUseCase(Params(userModel));
        results.fold((e) {
          CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
          print('the error in signup Submit is //////${e.message}');

          EasyLoading.dismiss();
        }, (b) async {
          CustomSnakeBars.snakeBanner(
              context, 'Hello', 'Delivery Boy account has been created', 'success');
         await FirebaseAuth.instance.signOut();

          String email = GetStorage().read("email")??"";
          String pass = GetStorage().read("pass")??"";
          print('emiallllllllllllllllllllllll : $email');
          print('paswordddddddddddddddd : $pass');
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
          EasyLoading.dismiss();
          getCurrentUser();
        });
      }
    }
  }



  String profileImgUrl = '';
  Future<void> getUserPicture(BuildContext context, ImageSource source) async {
    EasyLoading.show();
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    print('Image File is ${file?.path}');
    if (file == null) return;
    Reference reference = FirebaseStorage.instance.ref()
        .child('ProfileImages')
        .child(currUser!.firstName!);
    try {
      Reference upload = reference;
      await upload.putFile(File(file.path));
      profileImgUrl = await upload.getDownloadURL();
      EasyLoading.dismiss();
      CustomSnakeBars.snakeBanner(
          context, 'Hello', 'Picture has been Uploaded', 'success');
      print('Image Url is $profileImgUrl');
      updateUserProfilePicture(context);
    }
    catch (e) {
      print('error is $e');
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  Future<void> updateUserProfilePicture(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('check your connection');
    } else {
      EasyLoading.show();
      UserModel model = UserModel(
          imgUrl: profileImgUrl.isEmpty ? currUser!.imgUrl! : profileImgUrl
      );
      var results = await updateUserPictureUseCase(Params(model));
      results.fold((e) {
        CustomSnakeBars.snakeBanner(context, 'Sorry', e.message, 'failure');
        print('the error in getUserProfilePicture is //////${e.message}');

        EasyLoading.dismiss();
      }, (b) {
        CustomSnakeBars.snakeBanner(
            context, 'Hello', 'Picture Has been updated', 'success');
        getCurrentUser();
        EasyLoading.dismiss();
      });
    }
  }


//
// void getPermission() async {
//   var status = await Permission.location.status;
//   if (status.isDenied) {
//     openAppSettings();
//   }
//   else{
//     print('Permission is Denied');
//   }
// }



}
