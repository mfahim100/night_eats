import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/admin/main_admin/presentation/widgets/admin_app_widgets/visible_container_for_order_screen.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/const_decorations.dart';


class OnTheWayScreenContainer extends StatefulWidget {


  final Color color;
  final String buttonText;
  final ClientOrderModel model;
  final Function()? onPressed;

  const OnTheWayScreenContainer({
    super.key,
     this.color = Colors.green,
    required this.model,
    required this.buttonText,
    this.onPressed,
  });

  @override
  State<OnTheWayScreenContainer> createState() =>
      _OnTheWayScreenContainerState();
}

class _OnTheWayScreenContainerState extends State<OnTheWayScreenContainer> {
  bool showContainer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 1.h),
      decoration: ConstDecoration.orderScreenContainerDecoration,
      // height: showContainer ? 45.h : 16.h,
      width: 90.w,
      child: Column(
        children: [


          SizedBox(
            width: 80.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Id: ${widget.model.orderId}',
                  style: GoogleFonts.poppins(
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  'Date: ${widget.model.date}',
                  style: GoogleFonts.poppins(
                      fontSize: 14.5.sp, color: Colors.black),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 1.h,
          ),

          InkWell(
            onTap: widget.onPressed,
            child: Container(
              width: 80.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(02.w),
              ),
              child: Center(
                child: Text(
                  widget.buttonText,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 1.h,
          ),

          ///Price Container
          ///
          Container(
            height: 4.h,
            width: 80.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(02.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 25.w,
                  child: Center(
                    child: Text(
                      'Details',
                      style: TextStyle(fontSize: 17.sp, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                    width: 25.w,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            showContainer = !showContainer;
                          });
                        },
                        icon: showContainer
                            ? Icon(
                                Icons.keyboard_double_arrow_up,
                                color: Colors.white,
                                size: 20.sp,
                              )
                            : Icon(
                                Icons.keyboard_double_arrow_down,
                                color: Colors.white,
                                size: 20.sp,
                              ))),
              ],
            ),
          ),
          Visibility(
              visible: showContainer,
              child: VisibleContainerForOrderScreen(mdl: widget.model.listOfCardModel!,
              )),

        ],
      ),
    );
  }
}
