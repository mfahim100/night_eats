import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/core/constants/const_colors.dart';
import 'package:night_eats/core/widgets/custom_button.dart';
import 'package:night_eats/features/admin/main_admin/presentation/widgets/admin_app_widgets/delete_item_dialog.dart';
import 'package:night_eats/features/client/domain/entities/cart_model.dart';
import 'package:night_eats/features/client/presentation/manager/client_controller.dart';
import 'package:night_eats/features/client/presentation/widgets/add_address_dialog.dart';
import 'package:night_eats/features/client/presentation/widgets/cart_screen_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/const_text_styles.dart';
import '../../../../../core/utils/injections.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = sl<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isResultLoaded.value
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            width: 100.w,
            height: 85.h,
            child: Column(
              children: [
                SizedBox(
                  height: 75.h,
                  child: controller.getAllCartItem.isEmpty
                      ? Center(
                          child: Text(
                            'No Order',
                            style: ConstTextStyle.noOrdersText
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.getAllCartItem.length,
                          itemBuilder: (context, index) {
                            CartModel mdl = controller.getAllCartItem[index];
                            return CartScreenContainer(
                                model: mdl,
                                onEdit: () {},
                                onDelete: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CustomDialog(
                                            onYes: () {
                                              controller
                                                  .deleteCurrentItemController(
                                                      context, mdl);
                                            },
                                            description:
                                                'Do you want to delete the order');
                                      });
                                });
                          }),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomButton(
                  text: 'Place Order',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AddAddressDialog();
                        });
                  },
                  color: ConstColors.blueColor,
                )
              ],
            ),
          ));
  }
}
