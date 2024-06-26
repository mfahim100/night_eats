import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:night_eats/features/client/presentation/manager/client_controller.dart';
import 'package:night_eats/features/client/presentation/widgets/our_product_container.dart';
import 'package:night_eats/features/client/presentation/widgets/our_product_container_two.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/const_decorations.dart';
import '../../../../../core/utils/injections.dart';
import '../../../../admin/main_admin/domain/entities/item_model.dart';

class NosProducts extends StatelessWidget {
   NosProducts({super.key});

  final controller = sl<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        controller.isResultLoaded.value ?
            const Center(child: CircularProgressIndicator())
        :
        SingleChildScrollView(
      child: Column(
        children: [

          SizedBox(height: 2.h,),

          Text('OUR PRODUCTS',style:ConstTextStyle.headerTextStyle),

          SizedBox(height: 1.h,),

          const OurProductContainer(text: 'REPAS', image: 'assets/images/repas.png'),

          SizedBox(height: 1.h,),

          Container(
            height: 20.h,
            width: 95.w,
            decoration:
            ConstDecoration.orderScreenContainerDecoration,
            child: CarouselSlider.builder(
                itemCount: controller.getMyItemList.length,
                itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) {
                  ItemModel mdl = controller.getMyItemList[itemIndex];
                  return SizedBox(
                    width: 85.w,
                    child: OurProductContainerTwo(
                      itemModel: mdl,),
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:
                  const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
          ),
          // const OurProductContainerTwo(itemModel: null,),



          SizedBox(height: 1.h,),

          const OurProductContainer(text: 'DESSERTS', image: 'assets/images/desserts.png'),
          SizedBox(height: 1.h,),
          const OurProductContainer(text: 'BOISSONS', image: 'assets/images/boissons.png')







        ],
      ),
    ));
  }
}
