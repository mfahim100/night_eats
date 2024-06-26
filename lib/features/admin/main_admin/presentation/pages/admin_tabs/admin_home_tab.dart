import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:night_eats/features/admin/main_admin/domain/entities/item_model.dart';
import 'package:night_eats/features/admin/main_admin/presentation/manager/admin_controller.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/const_colors.dart';
import '../../../../../../core/constants/const_decorations.dart';
import '../../../../../../core/utils/injections.dart';
import '../../widgets/admin_app_widgets/admin_home_tab_gridview_container.dart';
import 'add_new_item.dart';


class AdminHomeTab extends StatelessWidget {
  AdminHomeTab({super.key});

  final controller = sl<AdminController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () => Get.to( AddNewItem(text: 'Add New Item', btnText: 'Add New Item', onBtnPressed: () {
          controller.addNewItem(context);
          controller.getMyItemsController();
          // adminController.
        },)),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25.sp,
        ),
      ),
      body: SafeArea(
        child: Column(
            children: [
          Container(
            height: 10.h,
            color:ConstColors.blueColor,
            child:const Center(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                )),
          ),
          SizedBox(
            height: 2.h,
          ),
          Obx(
              ()=> controller.isResultLoaded.value ?
              const CircularProgressIndicator()
                  :Container(
                height: 20.h,
                width: 95.w,
                decoration:
                ConstDecoration.orderScreenContainerDecoration,
                child: CarouselSlider.builder(
                    itemCount: controller.slidingImages.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return SizedBox(
                        height: 16.h,
                        width: 90.w,
                        child: Image.network(
                          // fit: BoxFit.contain,
                            controller.slidingImages[itemIndex]),
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
              )
          ),
          Obx(
              ()=> controller.isResultLoaded.value ?

              const CircularProgressIndicator()
                  :
                  SizedBox(
                height: 52.h,
                width: 100.w,
                // padding: const EdgeInsets.only(bottom: 10),
                // decoration: ConstDecoration.adminGridViewContainerDecoration,
                child: ListView.builder(
                    itemCount: controller.getMyItemList.length,
                    itemBuilder: (context, index) {
                      ItemModel mdl = controller.getMyItemList[index];
                      return AdminHomeTabGridViewContainer(
                        itemModel: mdl,
                      );
                    }),
              ),
          ),
        ]),
      ),
    );
  }
}
