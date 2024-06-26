import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:night_eats/features/client/presentation/manager/client_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/const_text_styles.dart';
import '../../../../../../core/utils/injections.dart';
import '../../../../../admin/main_admin/presentation/manager/admin_controller.dart';
import '../../../../../admin/main_admin/presentation/widgets/admin_app_widgets/on_the_way_screen_container.dart';
import '../../../../domain/entities/client_order_model.dart';

class ClientOnTheWayOrder extends StatelessWidget {
  final double listViewBuilderHeight;

  ClientOnTheWayOrder({
    super.key,
    required this.listViewBuilderHeight,
  });

  final controller = sl<ClientController>();

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
                          'No Orders',
                            style:ConstTextStyle.noOrdersText
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.getOnTheWayOrderList.length,
                        itemBuilder: (context, index) {
                          ClientOrderModel mdl =
                              controller.getOnTheWayOrderList[index];
                          return OnTheWayScreenContainer(
                            onPressed: ()async{
                              var status = await Permission.location.status;
                              if(status.isDenied){
                                openAppSettings();
                              }
                              else{
                                final adminController = sl<AdminController>();
                                adminController.openMap(mdl.lat!, mdl.long!);
                              }

                            },
                            model: mdl,
                            buttonText: 'Open Map ',
                          );
                        }),
              ),
            ),
    );
  }
}