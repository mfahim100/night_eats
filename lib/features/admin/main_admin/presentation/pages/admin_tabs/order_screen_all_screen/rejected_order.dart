import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/admin/main_admin/presentation/manager/admin_controller.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../core/constants/const_text_styles.dart';
import '../../../../../../../core/utils/injections.dart';
import '../../../widgets/admin_app_widgets/on_the_way_screen_container.dart';

class RejectedOrder extends StatelessWidget {
  final double listViewBuilderHeight;

  RejectedOrder({super.key, required this.listViewBuilderHeight});

  final controller = sl<AdminController>();

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
              child: controller.getRejectedOrdersList.isEmpty
                  ? Center(
                      child: Text(
                        'No Orders',
                          style: ConstTextStyle.noOrdersText
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.getRejectedOrdersList.length,
                      itemBuilder: (context, index) {
                        ClientOrderModel mdl =
                            controller.getRejectedOrdersList[index];
                        return OnTheWayScreenContainer(
                          color: Colors.red,
                          buttonText: 'Rejected',
                          model: mdl,
                        );
                      }),
            ),
          ));
  }
}
