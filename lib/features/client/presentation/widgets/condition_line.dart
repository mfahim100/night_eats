import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_text_styles.dart';

class ConditionLine extends StatelessWidget {
  final String text;
  const ConditionLine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.all(3.w),
        child: Text(text,style: ConstTextStyle.conditionAndTermsLine,)
    );
  }
}
