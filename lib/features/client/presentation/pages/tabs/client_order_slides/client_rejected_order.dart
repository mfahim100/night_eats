import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:night_eats/features/client/presentation/manager/client_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../core/constants/const_text_styles.dart';
import '../../../../../../core/utils/injections.dart';
import '../../../../../admin/main_admin/presentation/widgets/admin_app_widgets/on_the_way_screen_container.dart';
import '../../../../domain/entities/client_order_model.dart';

class ClientRejectedOrder extends StatelessWidget {
  final double listViewBuilderHeight;

  ClientRejectedOrder({super.key, required this.listViewBuilderHeight});

  final controller = sl<ClientController>();

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
