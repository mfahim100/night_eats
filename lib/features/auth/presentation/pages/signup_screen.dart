import 'package:flutter/material.dart';
import 'package:night_eats/core/widgets/custom_textfield_phonenumber.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_colors.dart';
import '../../../../core/utils/injections.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/passwod_textfield.dart';
import '../manager/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = sl<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              height: 83.h,
              child: SingleChildScrollView(
                child: Form(
                  key: controller.signUpFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextField(
                        controller: controller.signUpFirstNameController,
                        validator: controller.validateFirstNameField,
                        text: 'First Name',
                        hintText: 'Enter Your First Name',
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        controller: controller.signUpLastNameController,
                        validator: controller.validateLastNameField,
                        text: 'Last Name',
                        hintText: 'Enter Your Last Name',
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        controller: controller.signUpEmailController,
                        validator: controller.validateEmailField,
                        text: 'Email',
                        hintText: 'Enter Your email',
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                       PasswordTextField(
                        controller: controller.signUpPasswordController,
                        validator: controller.validatePasswordField,
                        text: 'Password',
                        hintText: 'Enter Your Password',
                        isPass: true,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        controller: controller.signUpNumberAndStreetController,
                        validator: controller.validateNumberAndStreetField,
                        text: 'Number and Street',
                        hintText: 'Enter Number and Street',
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        controller: controller.signUpPostalCodeAndCityController,
                        validator: controller.validatePostalCodeAndCityField,
                        text: 'Postal Code and city',
                        hintText: 'Enter Postal Code and city',
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextFieldPhoneNumber(
                        controller: controller.signUpMobileNumberController,
                        validator: controller.validateMobileNumberField,
                        text: 'Phone Number',
                        hintText: 'Enter Phone Number',
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomButton(
                        color: ConstColors.blueColor,
                        text: 'Create Account',
                        onPressed: () {
                          if(controller.signUpFormKey.currentState!.validate()){
                            controller.signUpSubmit(context);
                          }
                        }
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
