import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/const_colors.dart';
import '../constants/const_text_styles.dart';

class CustomTextFieldPhoneNumber extends StatelessWidget {
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

  CustomTextFieldPhoneNumber(
      {super.key,
      required this.text,
      required this.hintText,
      this.prefix,
      this.suffixButton,
       this.obscureText = false,
       this.textInputType = TextInputType.text,
      this.suffix,
      this.maxLength,
       this.isPass=false,
      this.validator,
      this.controller});

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
          SizedBox(
            height: 6.2.h,
            child: Row(
              children: [

                Container(
                  height: 6.2.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                      color: ConstColors.orangeColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(04.w),
                        bottomLeft: Radius.circular(04.w),
                      )
                  ),
                  child: Row(
                    children: [

                      SizedBox(width: 3.w,),

                      Container(
                        height: 5.6.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.w)
                        ),
                        child:  CountryCodePicker(
                          onChanged: print,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IT',
                          searchStyle: const TextStyle(color: Colors.black,),
                          textStyle: GoogleFonts.poppins(color: Colors.black,fontSize: 14.sp),
                          dialogTextStyle: const TextStyle(color: Colors.black),
                          favorite: const ['+92','PAK'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          showFlag: false,
                          // optional. aligns the flag and the Text left
                          // alignLeft: false,
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(
                  width: 56.w,
                  child: TextFormField(
                    maxLength: maxLength,
                    validator: validator,
                    keyboardType: textInputType,
                    obscureText: obscureText,
                    controller: controller,
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 14.sp),
                    decoration: InputDecoration(
                        errorStyle:  TextStyle(color: Colors.redAccent,fontSize: 14.sp),
                        labelStyle: TextStyle(color: Colors.white,fontSize: 14.sp),
                        hintStyle: TextStyle(color: Colors.white,fontSize: 14.sp),
                        suffix: suffixButton,
                        hintText: hintText,
                        prefixIcon: prefix,
                        suffixIcon: suffix,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 5.w),
                        focusedBorder: buildOutlineInputBorder(),
                        border: buildOutlineInputBorder(),
                        enabledBorder: buildOutlineInputBorder(),
                        errorBorder: buildOutlineInputBorder(isRed: true),
                        focusedErrorBorder: buildOutlineInputBorder(isRed: true),
                        disabledBorder: buildOutlineInputBorder(),
                        fillColor: ConstColors.orangeColor,
                        filled: true

                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




OutlineInputBorder buildOutlineInputBorder({bool isRed=false}) {
  return OutlineInputBorder(
    borderSide:  BorderSide(
        color:isRed?Colors.redAccent: ConstColors.orangeColor,
        style:isRed?BorderStyle.none: BorderStyle.solid
    ),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(04.w),
      bottomRight: Radius.circular(04.w),
    ),
  );
}
