import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/client/domain/entities/cart_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_decorations.dart';

class CartScreenContainer extends StatelessWidget {
  final CartModel model;
  final Function() onEdit,onDelete;
  const CartScreenContainer({super.key, required this.model, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.w),
      height: 15.h,
      width: 90.w,
      decoration:
      ConstDecoration.orderScreenContainerDecoration,
      // color: Colors.red,
      child: Row(
        children: [
          SizedBox(
            height: 13.h,
            width: 35.w,
            child: model.itemImage!.isEmpty ? Image.asset(
              'assets/images/product_avatar.png',
              fit: BoxFit.cover,
            ):
            Image.network(
              model.itemImage!,
              fit: BoxFit.cover,
            ),

          ),
          Container(
            padding: EdgeInsets.only(left: 3.w),
            width: 40.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.itemName!,
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  model.itemDescription!.length > 50 ?
                  model.itemDescription!.substring(0,50) : model.itemDescription!,
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Price ${model.itemPrice}',
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),

                Text(
                  'Quantity ${model.quantity}',
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),

                Text(
                  'Total ${model.total}',
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),

              ],
            ),
          ),

          SizedBox(
            width: 10.w,
            child: Padding(
              padding:  EdgeInsets.only(top: 1.w,bottom: 1.w),
              child: Column(
                children: [
                  IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
                  IconButton(onPressed: onDelete, icon: const Icon(Icons.delete,color: Colors.red,)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
