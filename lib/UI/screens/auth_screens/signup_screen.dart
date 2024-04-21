import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/const_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/passwod_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 8.h,
                  color:ConstColors.blueColor,
                  child: const Center(
                    child: Image(image: AssetImage('assets/images/logo.png'),),
                  ),
                ),

                CustomTextField(text: 'Name', hintText: 'Enter Your Name'),
                CustomTextField(text: 'First Name', hintText: 'Enter Your First Name'),
                CustomTextField(text: 'Email', hintText: 'Enter Your email'),
                const PasswordTextField(text: 'Password', hintText: 'Enter Your Password',isPass: true,),
                CustomTextField(text: 'Number and Street', hintText: 'Enter Number and Street'),
                CustomTextField(text: 'Postal Code and city', hintText: 'Enter Postal Code and city'),
                CustomTextField(text: 'Phone Number', hintText: 'Enter Phone Number'),
                SizedBox(height: 1.h,),
                CustomButton(text: 'Create Account', onPressed: (){},color: ConstColors.blueColor,),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
