import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';

class ConstColorButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const ConstColorButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: Container(
        height: 7.h,
        width: 80.w,
        decoration: BoxDecoration(
            color: ConstColors.orangeColor,
            borderRadius: BorderRadius.circular(05.w)
        ),
        child: Center(
          child: Text(text,style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
