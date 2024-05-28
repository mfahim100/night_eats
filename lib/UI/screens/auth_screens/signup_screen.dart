import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:night_eats/UI/widgets/custom_textfield_phonenumber.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/const_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/passwod_textfield.dart';
import 'acount_verification_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [    Container(
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
                child: Column(
                  children: [


                    SizedBox(
                      height: 4.h,
                    ),
                    CustomTextField(text: 'Name', hintText: 'Enter Your Name'),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                        text: 'First Name', hintText: 'Enter Your First Name'),

                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(text: 'Email', hintText: 'Enter Your email'),
                    SizedBox(
                      height: 2.h,
                    ),   const PasswordTextField(
                      text: 'Password',
                      hintText: 'Enter Your Password',
                      isPass: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),     CustomTextField(
                        text: 'Number and Street',
                        hintText: 'Enter Number and Street'),
                    SizedBox(
                      height: 2.h,
                    ),  CustomTextField(
                        text: 'Postal Code and city',
                        hintText: 'Enter Postal Code and city'),
                    SizedBox(
                      height: 2.h,
                    ),    CustomTextFieldPhoneNumber(
                        text: 'Phone Number', hintText: 'Enter Phone Number'),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomButton(
                      text: 'Create Account',
                      onPressed: () => Get.to(const AccountVerificationScreen()),
                      color: ConstColors.blueColor,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
