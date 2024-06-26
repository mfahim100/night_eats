import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/delivery/presentation/manager/deliver_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/injections.dart';
import '../../../../admin/main_admin/presentation/widgets/admin_app_widgets/on_the_way_screen_container.dart';
import '../../../../client/domain/entities/client_order_model.dart';

class DeliveryDeliveredOrder extends StatelessWidget {
  final double listViewBuilderHeight;

  DeliveryDeliveredOrder({super.key, required this.listViewBuilderHeight});

  final controller = sl<DeliveryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isResultLoaded.value
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: 70.h,
            width: 100.w,
            child: SizedBox(
              height: listViewBuilderHeight,
              width: 98.w,
              child: controller.getDeliveredOrderList.isEmpty
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
                      itemCount: controller.getDeliveredOrderList.length,
                      itemBuilder: (context, index) {
                        ClientOrderModel mdl =
                            controller.getDeliveredOrderList[index];
                        return OnTheWayScreenContainer(
                          model: mdl,
                          buttonText: 'Delivered',
                        );
                      }),
            ),
          ));
  }
}
