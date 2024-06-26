import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/core/widgets/custom_drop_down.dart';
import 'package:night_eats/features/admin/main_admin/presentation/manager/admin_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/const_colors.dart';
import '../../../../../../core/constants/const_decorations.dart';
import '../../../../../../core/utils/injections.dart';

class UpdateOrderDialog extends StatelessWidget {
  final Function() onYes;
  final String description;
   UpdateOrderDialog({super.key, required this.onYes, required this.description});

  final controller = sl<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 80.w,
        height: 28.h,
        child: Stack(
          children: [
            Container(
              width: 80.w,
              height: 24.h,
              decoration: ConstDecoration.orderScreenContainerDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Warning!!',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Divider(
                    height: 1.h,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),

                  SizedBox(
                    height: 1.h,
                  ),
                 Padding(
                   padding:  EdgeInsets.only(left: 2.w,right: 2.w),
                   child: CustomDropDownMenu(text: 'Select Delivery Boy', items: controller.allDeliveryBoys, onChanged: (txt)=>controller.setTradeType(txt!)),
                 )

                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: onYes,
                      child: CircleAvatar(
                        radius: 8.w,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7.5.w,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 7.w,
                            backgroundColor: ConstColors.blueColor,
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: CircleAvatar(
                        radius: 8.w,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7.5.w,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 7.w,
                            backgroundColor: Colors.red,
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
