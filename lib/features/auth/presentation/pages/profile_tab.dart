import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_decorations.dart';
import '../../../../core/utils/injections.dart';
import '../manager/auth_controller.dart';
import '../widgets/image_dialog_box.dart';
import 'login_screen.dart';
import '../../../admin/main_admin/presentation/widgets/admin_app_widgets/profile_button.dart';
import '../../../admin/main_admin/presentation/widgets/admin_app_widgets/profile_listtile.dart';



class ProfileTab extends StatelessWidget {

   ProfileTab({super.key});

  final controller = sl<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        controller.isResultLoaded.value?
            const Center(child: CircularProgressIndicator())
        :
        SafeArea(
      child:  Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,
          color: ConstColors.kPrimaryColor,
          child: Column(
            children: [
              SizedBox(height: 1.h,),
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
                height: 77.h,
                width: 100.w,
                decoration: ConstDecoration.authScreenDecoration,
                child: Column(
                    children: [
                      SizedBox(
                        height: 35.h,
                        width: 95.w,
                        child:
                        Center(
                          child: Stack(
                            children: [

                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 30.h,
                                width: 30.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 5,color: Colors.black)
                                ),
                                child: Container(
                                    margin: EdgeInsets.all(01.w),
                                    height: 29.h,
                                    width: 29.h,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: controller.currUser!.imgUrl!.isEmpty ?
                                    Image.asset(
                                      'assets/images/avatar.jpg',fit: BoxFit.cover,)
                                        :
                                    Image.network(
                                      controller.currUser!.imgUrl!,fit: BoxFit.cover,)
                                ),


                              ),

                              Positioned(
                                right: 2.h,
                                bottom: 1.h,
                                child: CircleAvatar(
                                    radius: 6.w,
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: (context), builder: (context){
                                          return  ImageDialogBox();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.camera_alt_rounded,
                                        size: 30,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),

                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Column(
                          children: [
                            ProfileListTile(
                                title: 'Name:  ',
                                text: "${controller.currUser!.firstName} ${controller.currUser!.lastName}"
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),

                            ProfileListTile(
                                title: 'Email:  ',
                                text: controller.currUser!.email!
                            ),

                          ],
                        ),
                      ),


                      ProfileButton(
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        text: 'Change Password',
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      ProfileButton(
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          text: 'Log Out',
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Get.offAll(const LoginScreen());
                          }
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    )

    );
  }
}
