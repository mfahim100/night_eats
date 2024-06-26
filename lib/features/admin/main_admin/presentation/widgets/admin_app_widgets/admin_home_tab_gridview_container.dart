import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/admin/main_admin/domain/entities/item_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/const_decorations.dart';
import '../../pages/admin_tabs/item_details_tab.dart';


class AdminHomeTabGridViewContainer extends StatelessWidget {
 final ItemModel itemModel;

  const AdminHomeTabGridViewContainer({
    super.key,
    required this.itemModel,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  ()=> Get.to(   ItemDetailsTab(itemModel: itemModel,)),
      child: Container(
        width: 100.w,
        margin: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 1.h),
        decoration: ConstDecoration.orderScreenContainerDecoration,
        child: Padding(
          padding: EdgeInsets.all(1.w),
          child: Row(
            children: [
              SizedBox(
                height: 13.h,
                width: 35.w,
                child: itemModel.itemImage!.isEmpty ? Image.asset(
                  'assets/images/product_avatar.png',
                  fit: BoxFit.cover,
                ):
                Image.network(
                  itemModel.itemImage!,
                  fit: BoxFit.cover,
                ),

              ),
              Container(
                padding: EdgeInsets.only(left: 3.w),
                width: 50.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemModel.itemName!,
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      itemModel.itemDescription!.length > 50 ?
                      itemModel.itemDescription!.substring(0,50) : itemModel.itemDescription!,
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Price ${itemModel.itemPrice}',
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
