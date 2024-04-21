import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OurProductContainerTwo extends StatelessWidget {
  const OurProductContainerTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 25.h,
      width: 85.w,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Nos Sanwiches',style: GoogleFonts.poppins(
                fontSize:17.sp,
                fontWeight:FontWeight.bold
            ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10.h,
                width: 30.w,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/berger.png'),),
              ),
              SizedBox(
                  height: 10.h,
                  width: 50.w,
                  child: Column(
                    children: [

                      Text('L ITALIAN',style:GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff09250d),
                          fontSize: 20.sp,
                          decoration: TextDecoration.none),
                      ),
                      Text('PESTO, MOZERALLA, REQUETO',style:GoogleFonts.poppins(
                          color: const Color(0xff09250d),
                          fontSize: 15.sp,
                          decoration: TextDecoration.none),),
                      Text('JAMBON, TOMATES, SECHEES',style:GoogleFonts.poppins(
                          color: const Color(0xff09250d),
                          fontSize: 15.sp,
                          decoration: TextDecoration.none),),
                    ],
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10.h,
                width: 30.w,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/berger.png'),),
              ),
              SizedBox(
                  height: 10.h,
                  width: 50.w,
                  child: Column(
                    children: [

                      Text('L ITALIAN',style:GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff09250d),
                          fontSize: 20.sp,
                          decoration: TextDecoration.none),
                      ),
                      Text('PESTO, MOZERALLA, REQUETO',style:GoogleFonts.poppins(
                          color: const Color(0xff09250d),
                          fontSize: 15.sp,
                          decoration: TextDecoration.none),),
                      Text('JAMBON, TOMATES, SECHEES',style:GoogleFonts.poppins(
                          color: const Color(0xff09250d),
                          fontSize: 15.sp,
                          decoration: TextDecoration.none),),
                    ],
                  )
              ),
            ],
          ),

        ],
      ),
    );
  }
}
