import 'package:flutter/material.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/const_colors.dart';

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
          child: Text(text,style: ConstTextStyle.constColorTextButton,),
        ),
      ),
    );
  }
}
