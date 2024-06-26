import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_eats/features/client/presentation/pages/tabs/client_item_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_decorations.dart';
import '../../../admin/main_admin/domain/entities/item_model.dart';

class OurProductContainerTwo extends StatelessWidget {
  final ItemModel itemModel;
  const OurProductContainerTwo( {super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  ()=> Get.to(   ClientItemDetailsScreen(itemModel: itemModel,)),
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
            width: 40.w,
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
    );
  }
}

















// Column(
// children: [
// Align(
// alignment: Alignment.topLeft,
// child: Text('Nos Sanwiches',style: GoogleFonts.poppins(
// fontSize:17.sp,
// fontWeight:FontWeight.bold
// ),),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// SizedBox(
// height: 10.h,
// width: 30.w,
// child: const Image(
// fit: BoxFit.cover,
// image: AssetImage('assets/images/berger.png'),),
// ),
// SizedBox(
// height: 10.h,
// width: 50.w,
// child: Column(
// children: [
//
// Text('L ITALIAN',style:GoogleFonts.poppins(
// fontWeight: FontWeight.bold,
// color: const Color(0xff09250d),
// fontSize: 20.sp,
// decoration: TextDecoration.none),
// ),
// Text('PESTO, MOZERALLA, REQUETO',style:GoogleFonts.poppins(
// color: const Color(0xff09250d),
// fontSize: 15.sp,
// decoration: TextDecoration.none),),
// Text('JAMBON, TOMATES, SECHEES',style:GoogleFonts.poppins(
// color: const Color(0xff09250d),
// fontSize: 15.sp,
// decoration: TextDecoration.none),),
// ],
// )
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// SizedBox(
// height: 10.h,
// width: 30.w,
// child: const Image(
// fit: BoxFit.cover,
// image: AssetImage('assets/images/berger.png'),),
// ),
// SizedBox(
// height: 10.h,
// width: 50.w,
// child: Column(
// children: [
//
// Text('L ITALIAN',style:GoogleFonts.poppins(
// fontWeight: FontWeight.bold,
// color: const Color(0xff09250d),
// fontSize: 20.sp,
// decoration: TextDecoration.none),
// ),
// Text('PESTO, MOZERALLA, REQUETO',style:GoogleFonts.poppins(
// color: const Color(0xff09250d),
// fontSize: 15.sp,
// decoration: TextDecoration.none),),
// Text('JAMBON, TOMATES, SECHEES',style:GoogleFonts.poppins(
// color: const Color(0xff09250d),
// fontSize: 15.sp,
// decoration: TextDecoration.none),),
// ],
// )
// ),
// ],
// ),
//
// ],
// ),