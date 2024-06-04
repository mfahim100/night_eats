import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:night_eats/core/widgets/custom_button.dart';
import 'package:night_eats/core/widgets/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_colors.dart';
import '../../../../../core/constants/const_text_styles.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          SizedBox(height: 1.h,),
          Text('BONSOIR',style:ConstTextStyle.headerTextStyle,
          ),

          Text('KARIM',style:ConstTextStyle.headerSubTextStyle,
          ),


          SizedBox(height:2.h,),


          Text('READY TO SATISFIED YOUR',style:ConstTextStyle.headerDescTextStyle,
          ),
          Text('NIGHT-TIME DESIRES?',style:ConstTextStyle.headerDescTextStyle,
          ),

          SizedBox(
            height: 15.h,
            width: 100.w,
            child:
            CarouselSlider.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              const Image(image: AssetImage('assets/images/berger.png')), options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3)
            )
            )
          ),

          CustomTextField(text: 'NUMBER AND STREET', hintText: 'ENTER NUMBER AND STREET'),
          CustomTextField(text: 'POSTAL CODE AND CITY', hintText: 'ENTER POSTAL CODE AND CITY'),
          CustomTextField(text: 'PHONE NUMBER', hintText: 'ENTER PHONE NUMBER',textInputType: TextInputType.number,),


          SizedBox(height: 1.h,),

          CustomButton(text: 'SUBMIT', onPressed: (){},color: ConstColors.blueColor,)
        ,  SizedBox(height: 1.h,),


        ],
      ),
    );
  }
}
