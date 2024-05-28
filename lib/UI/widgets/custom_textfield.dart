import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/core/constants/const_colors.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String text, hintText;
  final Icon? prefix;
  final IconButton? suffixButton;
  late final bool obscureText;
  final TextInputType textInputType;
  final Icon? suffix;
  final int? maxLength;
  final bool isPass;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;

  CustomTextField({
    super.key,
    required this.text,
    required this.hintText,
    this.obscureText = false,
    this.prefix,
    this.suffixButton,
    this.textInputType = TextInputType.text,
    this.suffix,
    this.maxLength,
    this.validator,
    this.isPass = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: Column(
        children: [
          Align(
           alignment: Alignment.topLeft,
            child: Text(
              text,
              style: ConstTextStyle.titleTextStyle,
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Container(
            decoration: BoxDecoration(
                color: ConstColors.orangeColor,
                borderRadius: BorderRadius.circular(4.w)
            ),
            height: 7.h,
            child: TextFormField(
              maxLength: maxLength,
              validator: validator,
              keyboardType: textInputType,
              obscureText: obscureText,
              controller: controller,
              style:  TextStyle(color: Colors.white,decoration: TextDecoration.none,fontSize: 17.sp),
              decoration: InputDecoration(
                  errorStyle:  TextStyle(color: Colors.white,fontSize: 17.sp),
                  labelStyle: TextStyle(color: Colors.white,fontSize: 17.sp),
                  hintStyle: TextStyle(color: Colors.white,fontSize: 17.sp),
                  suffix: suffixButton,
                  hintText: hintText,
                  prefixIcon: prefix,
                  suffixIcon: suffix,
                  contentPadding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 5.w),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(3.w),
                  //   borderSide:  const BorderSide(
                  //     color: Colors.black,
                  //   ),
                  // ),
                  border: InputBorder.none
                // focusedBorder: OutlineInputBorder(
                //   borderSide: const BorderSide(
                //       color: Colors.black
                //   ),
                //   borderRadius: BorderRadius.circular(3.w),
                // ),
              ),
            ),
          ),

          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}