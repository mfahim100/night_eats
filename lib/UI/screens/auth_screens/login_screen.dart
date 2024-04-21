import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:night_eats/UI/screens/auth_screens/signup_screen.dart';
import 'package:night_eats/UI/widgets/const_color_button.dart';
import 'package:night_eats/UI/widgets/custom_button.dart';
import 'package:night_eats/UI/widgets/custom_textfield.dart';
import 'package:night_eats/UI/widgets/passwod_textfield.dart';
import 'package:night_eats/core/constants/const_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/const_text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
               SizedBox(height: 10.h,),
               
               CustomTextField(text: 'Email', hintText: 'Enter Your email'),
           
               const PasswordTextField(text: 'Password', hintText: 'Enter Your Password',isPass: true,),
           
               SizedBox(height: 2.h,),
               CustomButton(text: 'Login', onPressed: (){},color: ConstColors.blueColor,),
           
           
           
               TextButton(
                   onPressed: (){},
                   child:  Text(
                       'Forgot Password?  ',
                       style: ConstTextStyle.textButtonStyle
                   )),
           
               SizedBox(height: 10.h,),
               
               ConstColorButton(text: 'Create an account', onPressed: (){
                 Get.to(const SignUpScreen());
               })
           
           
              
             ],
           ),
         ),
        ),
      ),
    );
  }
}
