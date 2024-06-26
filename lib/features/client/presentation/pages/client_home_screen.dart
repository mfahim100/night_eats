import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:night_eats/features/client/presentation/pages/tabs/cart_screen.dart';
import 'package:night_eats/features/client/presentation/pages/tabs/client_profile_tab.dart';
import 'package:night_eats/features/client/presentation/pages/tabs/condition_and_terms.dart';
import 'package:night_eats/features/client/presentation/pages/tabs/contact_us_screen.dart';
import 'package:night_eats/features/client/presentation/pages/tabs/map_screen.dart';
import 'package:night_eats/features/client/presentation/pages/tabs/my_order.dart';
import 'package:night_eats/features/client/presentation/pages/tabs/nos_products.dart';
import 'package:night_eats/features/client/presentation/pages/tabs/order_screen.dart';
import 'package:night_eats/core/controllers/home_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_colors.dart';
import '../../../../core/utils/injections.dart';
import '../widgets/my_drawer.dart';

class ClientHomeScreen extends StatelessWidget {
  ClientHomeScreen({super.key});

  final controller = sl<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: Container(
        color: Colors.transparent,
        width: 75.w,
        child: const Drawer(
          backgroundColor: Colors.transparent,
          child: MyDrawer(),
        ),
      ),
      key: controller.scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 10.h,
              color: ConstColors.blueColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  const SizedBox.shrink(),
                  SizedBox(
                      height: 8.5.h,
                      child: const Image(
                        image: AssetImage('assets/images/logo.png'),
                      )),
                  IconButton(
                      onPressed: () {
                        if (controller
                                .scaffoldKey.currentState!.isEndDrawerOpen ==
                            false) {
                          controller.scaffoldKey.currentState!.openEndDrawer();
                        } else {
                          controller.scaffoldKey.currentState!.closeEndDrawer();
                        }
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30.sp,
                      ))
                ],
              ),
            ),
            Obx(() => controller.tabIndex.value == 0
                ? OrderScreen()
                : controller.tabIndex.value == 1
                    ? NosProducts()
                    : controller.tabIndex.value == 2
                        ? CartScreen()
                        : controller.tabIndex.value == 3
                            ? MyOrderScreen()
                            : controller.tabIndex.value == 4
                                ? const ConditionAndTerms()
                                : controller.tabIndex.value == 5
                                    ? const MapScreen()
                                    : controller.tabIndex.value == 6
                                        ? const MapScreen()
                                        : controller.tabIndex.value == 7
                                            ?  ContactUsScreen()
                                            : ClientProfileTab()),
          ],
        ),
      ),
    );
  }
}
