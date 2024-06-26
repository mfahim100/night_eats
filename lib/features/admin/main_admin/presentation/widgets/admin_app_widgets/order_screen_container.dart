import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/core/constants/const_decorations.dart';
import 'package:night_eats/features/admin/main_admin/presentation/widgets/admin_app_widgets/accept_and_reject_button.dart';
import 'package:night_eats/features/admin/main_admin/presentation/widgets/admin_app_widgets/visible_container_for_order_screen.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderScreenContainer extends StatefulWidget {
  final ClientOrderModel model;
  final String greenButtonText, redButtonText;
  final Function() greenButtonPressed, redButtonPressed;


  const OrderScreenContainer({
    super.key,
    required this.model,
    required this.greenButtonText,
    required this.redButtonText,
    required this.greenButtonPressed,
    required this.redButtonPressed,
  });


  @override
  State<OrderScreenContainer> createState() => _OrderScreenContainerState();
}

class _OrderScreenContainerState extends State<OrderScreenContainer> {
  bool showContainer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
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

          AcceptAndRejectButton(
              greenButtonText: widget.greenButtonText,
              redButtonText: widget.redButtonText,
              greenButtonPressed: widget.greenButtonPressed,
              redButtonPressed: widget.redButtonPressed
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
