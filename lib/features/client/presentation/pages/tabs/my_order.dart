import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/constants/const_colors.dart';

import 'client_order_slides/client_delivered_orders.dart';
import 'client_order_slides/client_on_the_way_order.dart';
import 'client_order_slides/client_rejected_order.dart';


class MyOrderScreen extends StatelessWidget {
   MyOrderScreen({super.key});

  final _controller = PageController();
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: 85.38.h,
          width: 100.w,
          color: ConstColors.kPrimaryColor,
          child: Column(children: [
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

                      SizedBox(width: 1.w,),
                      SizedBox(

                        width: 28.w,
                        height: 4.h,
                        child:  Center(
                          child: Text('On The Way',style: TextStyle(color: Colors.white,
                              fontSize: 15.sp)),
                        ),
                      ),


                      SizedBox(width: 4.w,),

                      SizedBox(
                        width: 30.w,
                        height: 4.h,
                        child: const Center(
                          child: Text('Reject',style: TextStyle(color: Colors.white)),
                        ),
                      ),


                      SizedBox(width: 3.w,),

                      SizedBox(
                        width: 30.w,
                        height: 4.h,
                        child: const Center(
                          child: Text('Delivered',style: TextStyle(color: Colors.white)),
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
                          dotWidth:  30.w,
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
              height: 79.h,
              color: Colors.white,
              // decoration: ConstDecoration.mainContainerDecoration,
              child:  PageView(
                controller: _controller,
                children:  [
                  ClientOnTheWayOrder(
                    listViewBuilderHeight: 77.h,
                  ),
                  ClientRejectedOrder(
                    listViewBuilderHeight: 77.h,
                  ),
                  ClientDeliveredOrders(
                    listViewBuilderHeight: 77.h,
                  )
                ],
              ),
            )
          ])),
    );
  }

}

