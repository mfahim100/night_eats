
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:night_eats/features/client/presentation/manager/client_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_colors.dart';
import '../../../../../core/constants/const_decorations.dart';
import '../../../../../core/utils/injections.dart';
import '../../../../admin/main_admin/domain/entities/item_model.dart';

class ClientItemDetailsScreen extends StatelessWidget {
  final ItemModel itemModel;
   ClientItemDetailsScreen({super.key, required this.itemModel});

  final controller = sl<ClientController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => controller.isResultLoaded.value ?
        const CircularProgressIndicator()
            :
        SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(
                children: [
                  Container(
                    height: 10.h,
                    color:ConstColors.blueColor,
                    child:Row(
                      children: [

                        IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 20.sp,)),

                        SizedBox(width: 21.w,),

                        SizedBox(
                            height: 7.h,
                            child: const Image(
                              image: AssetImage('assets/images/logo.png'),
                            )),
                      ],
                    ),
                  ),

                  Container(
                      height: 35.h,
                      width: 98.w,
                      decoration: ConstDecoration.itemDetailsSliderContainer,
                      child:  SizedBox(
                          width: 90.w,
                          child: itemModel.itemImage!.isEmpty ? Image.asset(
                            // fit: BoxFit.contain,
                              'assets/images/product_avatar.png') :
                          Image.network(
                            // fit: BoxFit.contain,
                              itemModel.itemImage!)

                      )
                  ),


                  SizedBox(height: 2.h,),


                  SizedBox(
                    width: 90.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(itemModel.itemName!,style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            decoration: TextDecoration.none
                        ),),
                        Text('\$${itemModel.itemPrice}' ,style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            decoration: TextDecoration.none
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h,),

                  SizedBox(
                    width: 90.w,
                    child: Text('Description : ',style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.none
                    ),),
                  ),

                  SizedBox(
                    width: 90.w,
                    child: Text(itemModel.itemDescription!,style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                        decoration: TextDecoration.none
                    ),),
                  ),

                  SizedBox(height: 23.h,),
                  SizedBox(
                    height: 5.h,
                    width: 50.w,
                    child:  InputQty(
                      maxVal: 100,
                      initVal: 1,
                      minVal: 1,
                      steps: 1,
                      onQtyChanged: (val) {
                        controller.quantity = val;
                        // print('the value of quantity is """""""" $val');
                        // print('the value of ////// quantity is """""""" $quantity');
                      },
                    ),
                  ),

                  SizedBox(height: 1.h,),
                  InkWell(
                    onTap: (){
                      controller.addToCartController(context, itemModel);
                    },
                    child: Container(
                      height: 6.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                          color: ConstColors.blueColor,
                          borderRadius: BorderRadius.circular(05.w)
                      ),
                      child: Center(
                        child: Text('Add to cart',style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                            decoration: TextDecoration.none,
                            color: Colors.white
                        ),),
                      ),
                    ),
                  )





                ])),
        ),
      ),
    );
  }
}
