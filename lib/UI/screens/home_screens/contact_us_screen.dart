import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/UI/widgets/custom_button.dart';
import 'package:night_eats/UI/widgets/description_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/const_colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

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


                Text('Contact Us',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 26.sp,
                    decoration: TextDecoration.none),
                ),

                SizedBox(height: 3.h,),
                
                DescriptionTextField(hintText: 'Message'),
                
                SizedBox(height: 1.h,),
                
                
                CustomButton(text: 'ENVOYER', onPressed: (){},color: ConstColors.blueColor,),

                SizedBox(height: 7.h,),

                SizedBox(
                  height: 5.h,
                  width: 85.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.message,size: 24.sp,color: ConstColors.orangeColor,),

                      Text('CONTACT@NIGHTEATS.LU',style:GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18.sp,
                          decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h,),
                SizedBox(
                  height: 5.h,
                  width: 35.w,
                  child: Row(
                    children: [
                      Icon(Icons.nat,size: 24.sp,color: ConstColors.orangeColor,),
                      SizedBox(width: 1.h,),
                      Icon(Icons.camera_alt_outlined,size: 24.sp,color: ConstColors.orangeColor,),
                      SizedBox(width: 1.h,),
                      Icon(Icons.snapchat,size: 24.sp,color: ConstColors.orangeColor,),
                    ],
                  ),
                ),
                Text('NIGHTSEATS.LU',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 19.sp,
                    decoration: TextDecoration.none),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
