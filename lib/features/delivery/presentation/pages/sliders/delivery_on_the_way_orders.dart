import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/admin/main_admin/presentation/manager/admin_controller.dart';
import 'package:night_eats/features/delivery/presentation/manager/deliver_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/utils/injections.dart';
import '../../../../admin/main_admin/presentation/widgets/admin_app_widgets/delete_item_dialog.dart';
import '../../../../admin/main_admin/presentation/widgets/admin_app_widgets/order_screen_container.dart';
import '../../../../client/domain/entities/client_order_model.dart';

class DeliveryOnTheWayOrders extends StatelessWidget {
  final double listViewBuilderHeight;

  DeliveryOnTheWayOrders({
    super.key,
    required this.listViewBuilderHeight,
  });

  final controller = sl<DeliveryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isResultLoaded.value
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              height: 70.h,
              width: 100.w,
              child: SizedBox(
                height: listViewBuilderHeight,
                width: 98.w,
                child: controller.getOnTheWayOrderList.isEmpty
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
                        itemCount: controller.getOnTheWayOrderList.length,
                        itemBuilder: (context, index) {
                          ClientOrderModel mdl =
                              controller.getOnTheWayOrderList[index];
                          return OrderScreenContainer(
                            model: mdl,
                            greenButtonText: 'Delivered',
                            redButtonText: 'Map',
                            greenButtonPressed: ()async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomDialog(
                                      description:
                                      'Do You want to update order to delivered',
                                      onYes: () async {
                                        var status = await Permission.location.status;
                                        if (status.isDenied) {
                                          openAppSettings();
                                        }

                                        else{
                                          await controller
                                              .updateStatus(
                                              context, mdl.orderId!, 3)
                                              .whenComplete(() {
                                            Navigator.of(context).pop();
                                          });
                                        }

                                      },
                                    );
                                  });
                            },
                            redButtonPressed: () {
                              final adminController = sl<AdminController>();
                              adminController.openMap(mdl.lat!, mdl.long!);
                            },
                          );
                        }),
              ),
            ),
    );
  }
}
