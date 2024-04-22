import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/UI/screens/home_screens/order_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/const_colors.dart';

class AccountVerificationScreen extends StatefulWidget {
  const AccountVerificationScreen({super.key});

  @override
  State<AccountVerificationScreen> createState() => _AccountVerificationScreenState();
}

class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadScreen();
  }
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

                SizedBox(height:6.h,),


                Text('Confirm',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30.sp,
                    decoration: TextDecoration.none),
          ),

                Text('Your Account',style:GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 22.sp,
                    decoration: TextDecoration.none),
                ),


                SizedBox(height:4.h,),


                Text('Indicate the code',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: ConstColors.orangeColor,
                    fontSize: 20.sp,
                    decoration: TextDecoration.none),
                ),
                Text('receive by sms',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: ConstColors.orangeColor,
                    fontSize: 20.sp,
                    decoration: TextDecoration.none),
                ),

                SizedBox(height: 2.h,),

                OtpTextField(
                  textStyle: TextStyle(
                      fontSize: 20.sp
                  ),
                  fillColor: ConstColors.orangeColor,
                  showFieldAsBox: true,
                  focusedBorderColor: ConstColors.orangeColor,
                  disabledBorderColor: ConstColors.orangeColor,
                  enabledBorderColor: ConstColors.orangeColor,
                  borderColor: ConstColors.orangeColor,
                  numberOfFields: 6,
                  fieldWidth: 52,
                  filled: true,
                  keyboardType: TextInputType.number,
                  showCursor: true,
                ),


                SizedBox(height: 1.h,),

                Container(
                  height: 3.5.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color: ConstColors.blueColor,
                    borderRadius: BorderRadius.circular(06.w)
                  ),
                  child: const Center(
                    child: Text('0:30',style: TextStyle(color: Colors.white),),
                  ),
                ),

                SizedBox(height: 1.h,),
                Text('Return the Code',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: ConstColors.blueColor,
                    fontSize: 16.sp,
                    decoration: TextDecoration.none),
                ),







              ],
            ),
          ),
        ),
      ),
    );
  }
  void loadScreen() {
    Timer(const Duration(seconds: 5), () {
     Get.offAll(const OrderScreen());
    });
  }
}
