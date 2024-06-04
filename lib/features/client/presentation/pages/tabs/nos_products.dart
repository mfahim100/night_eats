import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/client/presentation/widgets/our_product_container.dart';
import 'package:night_eats/features/client/presentation/widgets/our_product_container_two.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NosProducts extends StatelessWidget {
  const NosProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [


          SizedBox(height: 2.h,),


          Text('OUR PRODUCTS',style:ConstTextStyle.headerTextStyle),

          SizedBox(height: 1.h,),

          const OurProductContainer(text: 'REPAS', image: 'assets/images/repas.png'),

          SizedBox(height: 1.h,),
          const OurProductContainerTwo(),

          SizedBox(height: 1.h,),

          const OurProductContainer(text: 'DESSERTS', image: 'assets/images/desserts.png'),
          SizedBox(height: 1.h,),
          const OurProductContainer(text: 'BOISSONS', image: 'assets/images/boissons.png')







        ],
      ),
    );
  }
}
