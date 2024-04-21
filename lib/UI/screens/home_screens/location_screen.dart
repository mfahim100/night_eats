import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/const_colors.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

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

                SizedBox(height: 1.h,),


                Text('THANKS',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 28.sp,
                    decoration: TextDecoration.none),
                ),

                Text('WE WILL COME TO YOU',style:GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 19.sp,
                    decoration: TextDecoration.none),
                ),
                Text(' AS SOON AS POSSIBLE',style:GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 19.sp,
                    decoration: TextDecoration.none),
                ),

                SizedBox(height: 3.h,),

                Container(
                  height: 55.h,
                  width: 90.w,
                  color: Colors.green,
                ),

                SizedBox(height: 1.h,),

                Text('WAITING TIME ESTIMATED',style:GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 17.sp,
                    decoration: TextDecoration.none),
                ),

                Text('20MIN',style:GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
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
