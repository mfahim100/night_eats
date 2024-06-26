import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:night_eats/features/auth/presentation/pages/forgot_password.dart';
import 'package:night_eats/features/auth/presentation/pages/signup_screen.dart';
import 'package:night_eats/core/widgets/const_color_button.dart';
import 'package:night_eats/core/widgets/custom_button.dart';
import 'package:night_eats/core/widgets/custom_textfield.dart';
import 'package:night_eats/core/widgets/passwod_textfield.dart';
import 'package:night_eats/core/constants/const_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_text_styles.dart';
import '../../../../core/utils/injections.dart';
import '../manager/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState()  {
    final controller = sl<AuthController>();
    if(FirebaseAuth.instance.currentUser != null){
       controller.getCurrentUser();
    }
    else{
      print('asdf');
    }
    super.initState();
  }

  final controller = sl<AuthController>();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Container(
                height: 10.h,
                color: ConstColors.blueColor,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70.h,
                width: 100.w,
                child: Form(
                  key: controller.signInFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: controller.signInEmailController,
                        validator: controller.validateEmailField,
                        text: 'Email',
                        hintText: 'Enter Your email',
                      ),
                      PasswordTextField(
                        controller: controller.signInPasswordController,
                        validator: controller.validatePasswordField,
                        text: 'Password',
                        hintText: 'Enter Your Password',
                        isPass: true,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomButton(
                        text: 'Login',
                        color: ConstColors.blueColor,
                        onPressed: () {
                          if(controller.signInFormKey.currentState!.validate()){
                            controller.signInSubmit(context);
                          }
                        }
                      ),
                      TextButton(
                          onPressed: () => Get.to(ForgotPassword()),
                          child: Text('Forgot Password?  ',
                              style: ConstTextStyle.textButtonStyle)),
                      SizedBox(
                        height: 10.h,
                      ),
                      ConstColorButton(
                          text: 'Create an account',
                          onPressed: () {
                            Get.to(SignUpScreen());
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
