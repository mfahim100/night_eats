import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/UI/widgets/custom_button.dart';
import 'package:night_eats/UI/widgets/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/const_colors.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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


                Text('HOME PAGE',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 26.sp,
                    decoration: TextDecoration.none),
                ),

                Text('KARIM',style:GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20.sp,
                    decoration: TextDecoration.none),
                ),


                SizedBox(height:2.h,),


                Text('READY TO SATISFIED YOUR',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: ConstColors.orangeColor,
                    fontSize: 20.sp,
                    decoration: TextDecoration.none),
                ),
                Text('NIGHT-TIME DESIRES?',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: ConstColors.orangeColor,
                    fontSize: 20.sp,
                    decoration: TextDecoration.none),
                ),

                SizedBox(
                  height: 15.h,
                  width: 60.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context,index){
                    return const Image(image: AssetImage('assets/images/berger.png'));
                  }),
                ),

                CustomTextField(text: 'NUMBER AND STREET', hintText: 'ENTER NUMBER AND STREET'),
                CustomTextField(text: 'POSTAL CODE AND CITY', hintText: 'ENTER POSTAL CODE AND CITY'),
                CustomTextField(text: 'PHONE NUMBER', hintText: 'ENTER PHONE NUMBER',textInputType: TextInputType.number,),


                SizedBox(height: 1.h,),

                CustomButton(text: 'SUBMIT', onPressed: (){},color: ConstColors.blueColor,)



              ],
            ),
          ),
        ),
      ),
    );
  }
}
