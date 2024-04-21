import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OurProductContainer extends StatelessWidget {
  final String text,image;

  const OurProductContainer({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 14.h,
      width: 85.w,
      decoration: BoxDecoration(
          color: const Color(0xff09250d),
          borderRadius: BorderRadius.circular(07.w)
      ),
      child: Padding(
        padding:  EdgeInsets.all(2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 28.w,
              child:  Image(image: AssetImage(image),),
            ),
            SizedBox(
                width: 35.w,
                child: Center(
                  child: Text(text,style: GoogleFonts.poppins(
                      fontSize:21.sp,
                      color:Colors.white
                  ),),
                )
            ),

            SizedBox(width: 08.w,)
          ],
        ),
      ),

    );
  }
}
