import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_colors.dart';
import '../../../../core/utils/injections.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../manager/client_controller.dart';

class AddAddressDialog extends StatelessWidget {
  AddAddressDialog({super.key});

  final controller = sl<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 45.h,
        width: 100.w,
        child: Padding(
          padding:  EdgeInsets.all(2.w),
          child: Form(
            key: controller.clientFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),

                CustomTextField(
                  controller: controller.numberAndStreetController,
                  validator: controller.validator,
                  text: 'NUMBER AND STREET',
                  hintText: 'ENTER NUMBER AND STREET',
                ),

                CustomTextField(
                  controller: controller.postalCodeAndCityController,
                  validator: controller.validator,
                  text: 'POSTAL CODE AND CITY',
                  hintText: 'ENTER POSTAL CODE AND CITY',
                ),
                CustomTextField(
                  controller: controller.phoneNumberController,
                  validator: controller.validator,
                  text: 'PHONE NUMBER',
                  hintText: 'ENTER PHONE NUMBER',
                  textInputType: TextInputType.number,
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomButton(
                  text: 'SUBMIT',
                  onPressed: () async {
                    if(controller.clientFormKey.currentState!.validate()){
                      await controller.addClientNewOrder(context).whenComplete((){
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  color: ConstColors.blueColor,
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
