import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/delivery/presentation/manager/deliver_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/injections.dart';
import '../../../../admin/main_admin/presentation/widgets/admin_app_widgets/delete_item_dialog.dart';
import '../../../../admin/main_admin/presentation/widgets/admin_app_widgets/order_screen_container.dart';
import '../../../../client/domain/entities/client_order_model.dart';

class DeliveryPendingOrder extends StatelessWidget {
  final double listViewBuilderHeight;


  DeliveryPendingOrder({super.key,
    required this.listViewBuilderHeight,
  });

  final controller = sl<DeliveryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
    controller.isResultLoaded.value ?
        const Center(child: CircularProgressIndicator())
    :
        SizedBox(
      height: listViewBuilderHeight,
      width: 100.w,
      child:
      controller.getAllOrdersList.isEmpty
                ? Center(
                    child: Text(
                      'No Order',
                      style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
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
                showDialog(context: context, builder: (context) {
                  return CustomDialog(
                      description: 'Do you want to update the order',
                      onYes: () {
                        controller.updateStatus(context, mdl.orderId!, 1);
                      });
                });
              },
              redButtonPressed: () {
                showDialog(context: context, builder: (context) {
                  return CustomDialog(
                      description: 'Do you want to reject the order',
                      onYes: () {
                        controller.updateStatus(context, mdl.orderId!, 2);
                      });
                });
              },
            );
          }),
    )
    );
  }
}
