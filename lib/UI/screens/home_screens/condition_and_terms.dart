import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/core/constants/const_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/const_colors.dart';

class ConditionAndTerms extends StatelessWidget {
  const ConditionAndTerms({super.key});

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
                  child: Row(
                    children: [
                      SizedBox(width: 32.w,),
                      const Image(image: AssetImage('assets/images/logo.png'),),
                      SizedBox(width: 14.w,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.menu,color:Colors.white,size: 30.sp,))
                    ],
                  ),
                ),

                SizedBox(height: 3.h,),


                Text('CONDITION & TERMS',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 22.sp,
                    decoration: TextDecoration.none),
                ),

                SizedBox(height: 1.h,),

                Padding(
                  padding:  EdgeInsets.all(3.w),
                  child: Text(ConstText.dummyText,style:GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15.sp,
                      decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(3.w),
                  child: Text(ConstText.dummyText,style:GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15.sp,
                      decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(3.w),
                  child: Text(ConstText.dummyText,style:GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15.sp,
                      decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(3.w),
                  child: Text(ConstText.dummyText,style:GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15.sp,
                      decoration: TextDecoration.none),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
