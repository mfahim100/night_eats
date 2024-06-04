import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'const_colors.dart';

class ConstTextStyle{


  static var textButtonStyle = GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 15.sp,
      decoration: TextDecoration.underline,
      decorationColor: Colors.black
  );
    static var headerTextStyle = GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 26.sp,
        decoration: TextDecoration.none);

  static var headerSubTextStyle = GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 20.sp,
      decoration: TextDecoration.none);

  static var linkStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      decoration: TextDecoration.none);


    static var headerDescTextStyle = GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: ConstColors.orangeColor,
        fontSize: 20.sp,
        decoration: TextDecoration.none);

 static var titleTextStyle = GoogleFonts.poppins(
     fontWeight: FontWeight.w600,
     color: Colors.black,
     fontSize: 16.sp,
     decoration: TextDecoration.none);



 static var customButtonTextStyle =  GoogleFonts.poppins(
  color: Colors.white,
  fontSize: 16.sp,
  fontWeight: FontWeight.w600);

 static var constColorTextButton = GoogleFonts.poppins(
     color: Colors.white,
     fontSize: 17.sp,
     fontWeight: FontWeight.bold);



 static var conditionAndTermsLine= GoogleFonts.poppins(
  color: Colors.black,
  fontSize: 15.sp,
  decoration: TextDecoration.none);



 static var mapTime = GoogleFonts.poppins(
     color: Colors.black,
     fontSize: 17.sp,
     decoration: TextDecoration.none);


  static var profileButton =  GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );


  static var profileListTile =  GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black
  );


}