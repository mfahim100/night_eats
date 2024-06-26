
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminCustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Icon? prefix;
  final IconButton? suffixButton;
  final bool obscureText;
  final TextInputType textInputType;
  final Icon? suffix;
  final int? maxLength;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;

  AdminCustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.prefix,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.suffix,
    this.controller,
    this.validator,
    this.maxLength,
    this.suffixButton,
    // required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 95.w,
          child: TextFormField(
            maxLength: maxLength,
            validator: validator,
            keyboardType: textInputType,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              suffix: suffixButton,
              hintText: hintText,
              labelText: labelText,
              prefixIcon: prefix,
              suffixIcon: suffix,
              contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.w),
              ),
            ),
          ),
        ),

        SizedBox(height: 2.h,)
      ],
    );
  }
}