import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/core/widgets/custom_button.dart';
import 'package:night_eats/core/widgets/custom_textfield.dart';
import 'package:night_eats/features/admin/main_admin/presentation/manager/admin_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../core/constants/const_colors.dart';
import '../../../../../../core/utils/injections.dart';

class AddNewItem extends StatelessWidget {
  final String text, btnText;
  final Function() onBtnPressed;

  AddNewItem(
      {super.key,
      required this.text,
      required this.btnText,
      required this.onBtnPressed});

  final controller = sl<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.addNewItemFormKey,
          child: Column(
              children: [
            Container(
              height: 10.h,
              color: ConstColors.blueColor,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20.sp,
                      )),
                  SizedBox(
                    width: 21.w,
                  ),
                  SizedBox(
                      height: 7.h,
                      child: const Image(
                        image: AssetImage('assets/images/logo.png'),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            CustomTextField(
              text: 'Item Name',
              hintText: 'Item Name',
              controller: controller.addNewItemController,
              validator: controller.validator,
            ),
            CustomTextField(
              text: 'Item Price',
              hintText: 'Item Price',
              textInputType: TextInputType.number,
              controller: controller.itemPriceController,
              validator: controller.validator,
            ),
            CustomTextField(
              text: 'Item Description',
              hintText: 'Item Description',
              controller: controller.itemDescription,
              validator: controller.validator,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
                text: 'Add Photo',
                onPressed: () {
                  if(controller.addNewItemFormKey.currentState!.validate()){
                    controller.uploadItemPicture(context);
                  }
                },
                color: ConstColors.blueColor),
            SizedBox(
              height: 2.h,
            ),
            CustomButton(
                text: btnText,
                onPressed: (){
                  if(controller.addNewItemFormKey.currentState!.validate()){
                    onBtnPressed();
                  }
                },
                color: ConstColors.blueColor),
          ]),
        ),
      ),
    );
  }
}
