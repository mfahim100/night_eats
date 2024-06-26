import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/core/constants/const_colors.dart';
import 'package:night_eats/core/constants/const_decorations.dart';
import 'package:night_eats/core/widgets/custom_button.dart';
import 'package:night_eats/core/widgets/custom_textfield.dart';
import 'package:night_eats/features/auth/presentation/manager/auth_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/utils/injections.dart';

class AddNewDeliveryBoyDialog extends StatelessWidget {
  AddNewDeliveryBoyDialog({super.key});

  final controller = sl<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 70.h,
        width: 100.w,
        decoration: ConstDecoration.adminHomePageSliderContainerDecoration,
        child: Form(
          key: controller.signUpFormKey,
          child: Padding(
            padding:  EdgeInsets.all(2.w),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Add New Delivery Boy',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(
                  controller: controller.signUpFirstNameController,
                  validator: controller.validateFirstNameField,
                  text: 'First Name',
                  hintText: 'First Name',
                ),
                CustomTextField(
                  controller: controller.signUpLastNameController,
                  validator: controller.validateLastNameField,
                  text: 'Last Name',
                  hintText: 'Last Name',
                ),
                CustomTextField(
                  controller: controller.signUpEmailController,
                  validator: controller.validateEmailField,
                  text: 'Email',
                  hintText: 'Email',
                ),
                CustomTextField(
                  controller: controller.signUpPasswordController,
                  validator: controller.validatePasswordField,
                  text: 'Password',
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomButton(
                  text: 'Add Delivery Boy',
                  onPressed: () {
                  if(controller.signUpFormKey.currentState!.validate()){
                    controller.addNewDeliveryBoy(context);

                  }
                  },
                  color: ConstColors.blueColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
