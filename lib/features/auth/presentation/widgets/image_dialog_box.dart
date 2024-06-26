import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:night_eats/core/constants/const_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_decorations.dart';
import '../../../../core/utils/injections.dart';
import '../../../../core/widgets/custom_button.dart';
import '../manager/auth_controller.dart';

class ImageDialogBox extends StatelessWidget {
   ImageDialogBox({super.key});
  final controller = sl<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 80.w,
        height: 30.h,
        child: Container(
          decoration: ConstDecoration.authScreenDecoration,
          padding: EdgeInsets.all(5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Gallery',
                      color: ConstColors.blueColor,
                      onPressed: () async {
                        controller.getUserPicture(
                            context, ImageSource.gallery);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomButton(
                      text: 'Camera',
                      color: ConstColors.blueColor,
                      onPressed: () async {
                        controller.getUserPicture(context, ImageSource.camera);
                      }
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomButton(
                        color: Colors.red,
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
