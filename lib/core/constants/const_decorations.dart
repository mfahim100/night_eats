import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstDecoration{



  static var authScreenDecoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(05.w),
        topRight: Radius.circular(05.w),
      ),
    color: Colors.white,
    // gradient:  LinearGradient(
    //     colors: [
    //       const Color(0xff082510).withOpacity(0.5),
    //       const Color(0xff032603).withOpacity(0.5),
    //       const Color(0xff222328).withOpacity(0.5),
    //       const Color(0xff10073d).withOpacity(0.5),
    //       const Color(0xff0d1734).withOpacity(0.5),
    //
    //     ],
    //     end: Alignment.topRight,
    //     begin: Alignment.bottomLeft
    // ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );


  static var mainContainerDecoration = BoxDecoration(
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


  static var adminHomePageSliderContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(05.w),
    gradient:  LinearGradient(
        colors: [
          const Color(0xff0a0f26).withOpacity(0.2),
          const Color(0xffffad1f).withOpacity(0.2),
          const Color(0xfffab94c).withOpacity(0.4),
          const Color(0xff0a0f26).withOpacity(0.5),
        ],
        end: Alignment.topLeft,
        begin: Alignment.bottomRight
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 07,
        blurRadius: 90,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );


  static var adminGridViewContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(05.w),
    gradient:  LinearGradient(
        colors: [
          const Color(0xff0a0f26).withOpacity(0.2),
          const Color(0xffffad1f).withOpacity(0.2),
          const Color(0xfffab94c).withOpacity(0.4),
          const Color(0xff0a0f26).withOpacity(0.5),
        ],
        end: Alignment.topRight,
        begin: Alignment.bottomLeft
    ),
    // boxShadow: [
    //   BoxShadow(
    //     color: Colors.grey.withOpacity(0.5),
    //     // spreadRadius: 07,
    //     // blurRadius: 05,
    //     offset: const Offset(0, 3), // changes position of shadow
    //   ),
    // ],
  );



  static var itemDetailsSliderContainer = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(07.w),
      bottomRight: Radius.circular(07.w),
    ),
    color: Colors.white,
    // gradient:  LinearGradient(
    //     colors: [
    //       const Color(0xff082510).withOpacity(0.5),
    //       const Color(0xff032603).withOpacity(0.5),
    //       const Color(0xff222328).withOpacity(0.5),
    //       const Color(0xff10073d).withOpacity(0.5),
    //       const Color(0xff0d1734).withOpacity(0.5),
    //
    //     ],
    //     end: Alignment.topRight,
    //     begin: Alignment.bottomLeft
    // ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );



  static var orderScreenContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(03.w),
    color: Colors.white,
    // gradient:  LinearGradient(
    //     colors: [
    //       const Color(0xff082510).withOpacity(0.5),
    //       const Color(0xff032603).withOpacity(0.5),
    //       const Color(0xff222328).withOpacity(0.5),
    //       const Color(0xff10073d).withOpacity(0.5),
    //       const Color(0xff0d1734).withOpacity(0.5),
    //
    //     ],
    //     end: Alignment.topRight,
    //     begin: Alignment.bottomLeft
    // ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );



}