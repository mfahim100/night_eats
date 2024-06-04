import 'package:flutter/material.dart';
import 'package:night_eats/features/client/presentation/widgets/condition_line.dart';
import 'package:night_eats/core/constants/const_text.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConditionAndTerms extends StatelessWidget {
  const ConditionAndTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Text(
            'CONDITION & TERMS',
            style: ConstTextStyle.linkStyle,
          ),
          SizedBox(
            height: 1.h,
          ),
          ConditionLine(text: ConstText.dummyText),
          ConditionLine(text: ConstText.dummyText),
          ConditionLine(text: ConstText.dummyText),
          ConditionLine(text: ConstText.dummyText),
        ],
      ),
    );
  }
}
