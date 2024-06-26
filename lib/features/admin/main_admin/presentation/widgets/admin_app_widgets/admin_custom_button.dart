import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminCustomButton extends StatelessWidget {
  final String btnText;
  final Function() onPressed;
  const AdminCustomButton({super.key, required this.btnText, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 6.h,
        width: 90.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(05.w)
        ),
        child: Center(
          child: Text(btnText,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 19.sp,
              decoration: TextDecoration.none,
              color: Colors.black
          ),),
        ),
      ),
    );
  }
}
