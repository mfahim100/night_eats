import 'package:flutter/material.dart';
import 'package:night_eats/core/widgets/custom_button.dart';
import 'package:night_eats/core/widgets/description_textfield.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/const_colors.dart';
import '../../../../../core/utils/injections.dart';
import '../../manager/client_controller.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final controller = sl<ClientController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.clientContactUsFormKey,
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Text('Contact Us', style: ConstTextStyle.headerTextStyle),
            SizedBox(
              height: 3.h,
            ),
            DescriptionTextField(
              controller: controller.messageController,
              validator: controller.validator,
              hintText: 'Message',
            ),
            SizedBox(
              height: 1.h,
            ),
            CustomButton(
              text: 'Submit',
              onPressed: () {
                if(controller.clientContactUsFormKey.currentState!.validate()){
                  ///
                  /// Function of add message

                }
              },
              color: ConstColors.blueColor,
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              height: 5.h,
              width: 85.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.message,
                    size: 24.sp,
                    color: ConstColors.orangeColor,
                  ),
                  Text('CONTACT@NIGHTEATS.LU',
                      style: ConstTextStyle.titleTextStyle),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 5.h,
              width: 35.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                  Icon(
                    Icons.nat,
                    size: 24.sp,
                    color: ConstColors.orangeColor,
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 24.sp,
                    color: ConstColors.orangeColor,
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Icon(
                    Icons.snapchat,
                    size: 24.sp,
                    color: ConstColors.orangeColor,
                  ),
                ],
              ),
            ),
            Text(
              'NIGHTSEATS.LU',
              style: ConstTextStyle.linkStyle,
            ),
          ],
        ),
      ),
    );
  }
}
