import 'package:flutter/material.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:night_eats/core/controllers/home_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_colors.dart';
import '../../../../core/utils/injections.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5.w),
              topRight: Radius.circular(5.w))),

      padding: EdgeInsets.only(top: 5.4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 8.h,
            color: ConstColors.blueColor,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 10,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ),
                const Center(
                  child:  Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ],
            ),
          ),
         SizedBox(height: 27.h,),
          ListTile(
            onTap: ()=>sl<HomeController>().setTabIndex(0),
            title: Text("Home ",style: ConstTextStyle.titleTextStyle,),
          ), SizedBox(height: 1.h,),
          ListTile(
            onTap: ()=>sl<HomeController>().setTabIndex(1),
            title: Text("NOS Products",style: ConstTextStyle.titleTextStyle,),
          ),

          SizedBox(height: 1.h,),
          ListTile(
            onTap: ()=>sl<HomeController>().setTabIndex(2),
            title: Text("My Order",style: ConstTextStyle.titleTextStyle,),
          ),

          SizedBox(height: 1.h,),
          ListTile(
            onTap: ()=>sl<HomeController>().setTabIndex(3),
            title: Text("Contact",style: ConstTextStyle.titleTextStyle,),
          ),

          SizedBox(height: 1.h,),
          ListTile(
            onTap: ()=>sl<HomeController>().setTabIndex(4),
            title: Text("Conditions & Terms",style: ConstTextStyle.titleTextStyle,),
          ),SizedBox(height: 1.h,),
          ListTile(
            onTap: ()=>sl<HomeController>().setTabIndex(5),
            title: Text("Deconnexion",style: ConstTextStyle.titleTextStyle,),
          ),SizedBox(height: 1.h,),
          ListTile(
            onTap: ()=>sl<HomeController>().setTabIndex(6),
            title: Text("Map",style: ConstTextStyle.titleTextStyle,),
          ),
        ],
      ),
      // ),
    );
  }
}
