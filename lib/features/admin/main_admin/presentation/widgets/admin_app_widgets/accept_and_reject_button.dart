import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AcceptAndRejectButton extends StatelessWidget {
  final Function() greenButtonPressed, redButtonPressed;
  final String greenButtonText, redButtonText;

  const AcceptAndRejectButton({
    super.key,
    required this.greenButtonPressed,
    required this.redButtonPressed,
    required this.greenButtonText,
    required this.redButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 4.h,
        width: 80.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: greenButtonPressed,
              child: Container(
                width: 35.w,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(02.w),
                ),
                child: Center(
                  child: Text(
                    greenButtonText,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: redButtonPressed,
              child: Container(
                width: 35.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(02.w),
                ),
                child: Center(
                  child: Text(
                    redButtonText,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
