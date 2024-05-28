
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/const_colors.dart';
import '../../../../../core/constants/const_decorations.dart';

class OrderScreen extends StatelessWidget {
   OrderScreen({super.key});

  final _controller = PageController();
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: 100.h,
          width: 100.w,
          color: ConstColors.kPrimaryColor,
          child: Column(children: [
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 8.h,
              color: ConstColors.blueColor,
              child: SizedBox(
                  height: 7.h,
                  child: const Image(
                    image: AssetImage('assets/images/logo.png'),
                  )),
            ),

            SizedBox(height: 1.h,),
            Container(
              height: 4.h,
              width: 100.w,
              decoration: BoxDecoration(
                // color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(02.w)
              ),
              child: Stack(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(

                        width: 32.w,
                        height: 4.h,
                        child: const Center(
                          child: Text('Pending',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      SizedBox(width: 3.w,),
                      SizedBox(

                        width: 30.w,
                        height: 4.h,
                        child: const Center(
                          child: Text('On The Way',style: TextStyle(color: Colors.white)),
                        ),
                      ),


                      SizedBox(width: 2.5.w,),

                      SizedBox(

                        width: 30.w,
                        height: 4.h,
                        child: const Center(
                          child: Text('Reject',style: TextStyle(color: Colors.white)),
                        ),
                      ),



                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.all(1.w),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      onDotClicked: (value){
                        _controller.jumpToPage(value);
                      },
                      effect:SlideEffect(
                        // spacing:  8.0,
                          radius:  5.w,
                          dotWidth:  31.w,
                          dotHeight:  4.h,
                          paintStyle:  PaintingStyle.stroke,
                          strokeWidth:  1.5,
                          dotColor:  Colors.white,
                          activeDotColor:  Colors.white70
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height:2.h,),
            Container(
              height: 71.h,
              decoration: ConstDecoration.allSignalDecoration,
              child:  PageView(
                controller: _controller,
                children: const [


                ],
              ),
            )
          ])),
    );
  }
}
