
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_colors.dart';
import '../../../../../core/constants/const_decorations.dart';
import '../../../../widgets/admin_widgets/profile_button.dart';
import '../../../../widgets/admin_widgets/profile_listtile.dart';


class ProfileTab extends StatelessWidget {

  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                CircleAvatar(
                                  radius: 30.w,
                                  backgroundImage:const AssetImage(
                                      'assets/images/avatar.jpg'),
                                ),

                                Positioned(
                                  right: 2.h,
                                  bottom: 1.h,
                                  child: CircleAvatar(
                                      radius: 6.w,
                                      child: IconButton(
                                        onPressed: () {},
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
                              const ProfileListTile(
                                  title: 'Name:  ',
                                  text: 'Muhammad Fahim'
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),

                              const ProfileListTile(
                                  title: 'Email:  ',
                                  text: 'thisisemail@gmial.com'
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
                              // FirebaseAuth.instance.signOut();
                              // Get.offAll(const LoginScreen());
                            }
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
