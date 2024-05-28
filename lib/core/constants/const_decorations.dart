import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstDecoration{



  static var authScreenDecoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(05.w),
        topRight: Radius.circular(05.w),
      ),
    gradient:  LinearGradient(
        colors: [
         const Color(0xff0a0f26).withOpacity(0.2),
         const Color(0xffffad1f).withOpacity(0.2),
         const Color(0xfffab94c).withOpacity(0.4),
         const Color(0xff0a0f26).withOpacity(0.5),
        ],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );


  static var allSignalDecoration = BoxDecoration(
    // borderRadius: BorderRadius.only(
    //   topLeft: Radius.circular(08.w),
    //   topRight: Radius.circular(08.w),
    // ),
    gradient:  LinearGradient(
        colors: [
          const Color(0xff0a0f26).withOpacity(0.2),
          const Color(0xffffad1f).withOpacity(0.2),
          const Color(0xfffab94c).withOpacity(0.4),
          const Color(0xff0a0f26).withOpacity(0.5),
        ],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );


}