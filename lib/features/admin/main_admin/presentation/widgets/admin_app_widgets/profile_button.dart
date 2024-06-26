import 'package:flutter/material.dart';
import 'package:night_eats/core/constants/const_colors.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ProfileButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Function() onPressed;

  const ProfileButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 90.w,
        height: 05.h,
        decoration: BoxDecoration(
          color: ConstColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Padding(
          padding: EdgeInsets.only(left:4.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon!,
              SizedBox(width: 6.w,),
              Text(text, style: ConstTextStyle.profileButton),
            ],
          ),
        ),
      ),
    );
  }
}
