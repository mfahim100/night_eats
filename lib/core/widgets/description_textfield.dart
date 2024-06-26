
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/core/constants/const_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DescriptionTextField extends StatelessWidget {
  final String hintText;
  final Icon? prefix;
  final IconButton? suffixButton;
  late final bool obscureText;
  final TextInputType textInputType;
  final Icon? suffix;
  final int? maxLength;
  final bool isPass;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;
   int  maxLines;

   DescriptionTextField({
    super.key,
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
     this.maxLines = 6
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      child: Column(
        children: [
          Padding(
          padding: EdgeInsets.only(right: 52.w),
            child: Text(
              'Message',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.sp,
                  decoration: TextDecoration.none),
            ),
          ),

          TextFormField(
            maxLength: maxLength,
            validator: validator,
            keyboardType: textInputType,
            obscureText: obscureText,
            controller: controller,
            maxLines: maxLines,
            style: const TextStyle(color: Colors.black,decoration: TextDecoration.none),
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Colors.black),
              labelStyle:  const TextStyle(color: Colors.black),
              hintStyle:  const TextStyle(color: Colors.black),
              suffix: suffixButton,
              hintText: hintText,
              prefixIcon: prefix,
              suffixIcon: suffix,
              contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 05.w),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(07.w),
                borderSide: BorderSide(
                  width: 1.w,
                  color: ConstColors.orangeColor,
                ),
                
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.w),
                borderSide:   BorderSide(
                  width: 2.w,
                  color: ConstColors.orangeColor,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2.w,
                    color: ConstColors.orangeColor,
                ),
                borderRadius: BorderRadius.circular(7.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:  BorderSide(
                    color:  ConstColors.orangeColor,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(7.w),
              ),
            ),
          ),
          SizedBox(height: 1.5.h,),
        ],
      ),
    );
  }
}