import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
     this.color
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 7.h,
        width: 45.w,
        decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(07.w)),
        child: Center(
          child: Text(
            text,
            style: ConstTextStyle.customButtonTextStyle
          ),
        ),
      ),
    );
  }
}
