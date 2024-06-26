import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:night_eats/core/constants/const_text_styles.dart';
import 'package:night_eats/features/admin/main_admin/presentation/manager/admin_controller.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../../core/utils/injections.dart';
import '../../../widgets/admin_app_widgets/on_the_way_screen_container.dart';


class DeliveredOrders extends StatelessWidget {
  final double listViewBuilderHeight;
   DeliveredOrders({super.key, required this.listViewBuilderHeight});

  final controller = sl<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
    controller.isResultLoaded.value ?
    const Center(child: CircularProgressIndicator())
        :
        SizedBox(
      height: 70.h,
      width: 100.w,
      child:
      controller.getDeliveredOrderList.isEmpty
          ? Center(
        child: Text(
          'No Orders',
          style: ConstTextStyle.noOrdersText,
        ),
      )
          :
      SizedBox(
        height:listViewBuilderHeight,
        width: 98.w,
        child: ListView.builder(
            itemCount: controller.getDeliveredOrderList.length,
            itemBuilder: (context, index) {
              ClientOrderModel mdl = controller.getDeliveredOrderList[index];
              return
                OnTheWayScreenContainer(
                model: mdl,
                buttonText: 'Delivered',
              );
            }),
      ),
    ));
  }
}
