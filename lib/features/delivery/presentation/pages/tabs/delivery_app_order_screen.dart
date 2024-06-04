import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/constants/const_colors.dart';
import '../../../../../core/constants/const_decorations.dart';
import '../../../../admin/main_admin/presentation/pages/admin_tabs/order_screen_all_screen/delivered_orders.dart';
import '../../../../admin/main_admin/presentation/pages/admin_tabs/order_screen_all_screen/on_the_way_order.dart';



class DeliveryAppOrderScreen extends StatelessWidget {
   DeliveryAppOrderScreen({super.key});


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
                        width: 47.w,
                        height: 4.h,
                        child:  Center(
                          child: Text('On The Way',style: TextStyle(color: Colors.white,
                              fontSize: 15.sp)),
                        ),
                      ),


                      SizedBox(width: 2.w,),



                      SizedBox(
                        width: 47.w,
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
                      count: 2,
                      onDotClicked: (value){
                        _controller.jumpToPage(value);
                      },
                      effect:SlideEffect(
                        // spacing:  8.0,
                          radius:  5.w,
                          dotWidth:  46.w,
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
              color: Colors.white,
              // decoration: ConstDecoration.mainContainerDecoration,
              child:  PageView(
                controller: _controller,
                children:  [
                  OnTheWayOrders(
                    listViewBuilderHeight: 69.h,
                  ),
                  DeliveredOrders(
                    listViewBuilderHeight: 69.h,
                  )
                ],
              ),
            )
          ])),
    );
  }
}
