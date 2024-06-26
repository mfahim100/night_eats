import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_text_styles.dart';
import '../../../../core/utils/injections.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../manager/auth_controller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

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
                  key: controller.forgotPasswordFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Text('Its All Right',
                          style: ConstTextStyle.forgotPassword),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Text('Enter the email address associated',
                          style: ConstTextStyle.forgotPasswordText),
                      Text('with your account',
                          style: ConstTextStyle.forgotPasswordText),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        controller: controller.forgotPasswordEmailController,
                        validator: controller.validateEmailField,
                        text: 'Email',
                        hintText: 'Enter Your email',
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomButton(
                          text: 'Send Email',
                          color: ConstColors.blueColor,
                          onPressed: () {
                            if (controller.forgotPasswordFormKey.currentState!
                                .validate()) {
                              controller.forgotPasswordSubmit(context);
                              print('//////////!!@@##%%^**((*&&&^^');
                            }
                          }),
                      TextButton(
                          onPressed: () {
                            if (controller.forgotPasswordFormKey.currentState!
                                .validate()) {
                              controller.forgotPasswordSubmit(context);
                              print('//////////!!@@##%%^**((*&&&^^');
                            }
                          },
                          child: Text('Resend Email?  ',
                              style: ConstTextStyle.textButtonStyle)),
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
