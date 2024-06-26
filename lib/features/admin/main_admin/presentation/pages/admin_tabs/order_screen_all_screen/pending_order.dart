import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/admin/main_admin/presentation/manager/admin_controller.dart';
import 'package:night_eats/features/admin/main_admin/presentation/widgets/admin_app_widgets/delete_item_dialog.dart';
import 'package:night_eats/features/admin/main_admin/presentation/widgets/admin_app_widgets/update_order_dialog.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../../core/constants/const_text_styles.dart';
import '../../../../../../../core/utils/injections.dart';
import '../../../widgets/admin_app_widgets/order_screen_container.dart';

class PendingOrder extends StatelessWidget {
  final double listViewBuilderHeight;

  // final double pendingOrderPageHeight;

  PendingOrder({
    super.key,
    required this.listViewBuilderHeight,
    // required this.pendingOrderPageHeight,
  });

  final controller = sl<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isResultLoaded.value
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: listViewBuilderHeight,
            width: 100.w,
            child: controller.getAllOrdersList.isEmpty
                ? Center(
                    child: Text(
                      'No Orders',
                        style: ConstTextStyle.noOrdersText
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.getAllOrdersList.length,
                    itemBuilder: (context, index) {
                      ClientOrderModel mdl = controller.getAllOrdersList[index];
                      return OrderScreenContainer(
                        model: mdl,
                        greenButtonText: 'Accept',
                        redButtonText: 'Reject',
                        greenButtonPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Form(
                                  key: controller.updateFromKey,
                                  child: UpdateOrderDialog(
                                      description:
                                          'Do you want to update the order',
                                      onYes: () async {
                                        if(controller.updateFromKey.currentState!.validate()){
                                          await controller
                                              .updateStatus(
                                              context, mdl.orderId!, 1)
                                              .whenComplete(() {
                                            Navigator.of(context).pop();
                                          });
                                        }
                                      }),
                                );
                              });
                        },
                        redButtonPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                    description:
                                        'Do you want to reject the order',
                                    onYes: () async {
                                      await controller
                                          .updateStatus(
                                              context, mdl.orderId!, 2)
                                          .whenComplete(() {
                                        Navigator.of(context).pop();
                                      });
                                    });
                              });
                        },
                      );
                    }),
          ));
  }
}
