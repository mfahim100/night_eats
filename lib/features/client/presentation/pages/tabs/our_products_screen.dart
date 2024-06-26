import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/client/presentation/manager/client_controller.dart';
import 'package:night_eats/features/client/presentation/widgets/our_product_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_colors.dart';
import '../../../../../core/utils/injections.dart';

class OurProductsScreen extends StatelessWidget {
   OurProductsScreen({super.key});

  final controller = sl<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>controller.isResultLoaded.value ?
        const Center(child: CircularProgressIndicator())
    :
        Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 8.h,
                  color:ConstColors.blueColor,
                  child: Row(
                    children: [
                      SizedBox(width: 32.w,),
                      const Image(image: AssetImage('assets/images/logo.png'),),
                      SizedBox(width: 14.w,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.menu,color:Colors.white,size: 30.sp,))
                    ],
                  ),
                ),

                SizedBox(height: 2.h,),


                Text('OUR PRODUCTS',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24.sp,
                    decoration: TextDecoration.none),
                ),


                SizedBox(height: 1.h,),

                const OurProductContainer(text: 'REPAS', image: 'assets/images/repas.png'),

                SizedBox(height: 1.h,),
                // const OurProductContainerTwo(itemModel: null,),

                SizedBox(height: 1.h,),

                const OurProductContainer(text: 'DESSERTS', image: 'assets/images/desserts.png'),
                SizedBox(height: 1.h,),
                const OurProductContainer(text: 'BOISSONS', image: 'assets/images/boissons.png')







              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}
