import 'package:flutter/material.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child: Column(
              children: [


                SizedBox(height: 1.h,),


                Text('THANKS',style:ConstTextStyle.headerTextStyle),

                Text('WE WILL COME TO YOU',style:ConstTextStyle.headerSubTextStyle),
                Text(' AS SOON AS POSSIBLE',style:ConstTextStyle.headerSubTextStyle),

                SizedBox(height: 3.h,),
                Image.asset(
                  "assets/images/dummy_map.png",
                  height: 55.h,
                  width: 90.w,

                ),
                SizedBox(height: 1.h,),
                Text('WAITING TIME ESTIMATED',style:ConstTextStyle.mapTime,),

                Text('20MIN',style:ConstTextStyle.mapTime),



              ],
            ),
          );
  }
}
