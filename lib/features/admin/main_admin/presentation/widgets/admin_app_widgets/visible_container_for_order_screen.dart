
import 'package:flutter/material.dart';
import 'package:night_eats/features/client/presentation/manager/client_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../core/utils/injections.dart';


class VisibleContainerForOrderScreen extends StatelessWidget {
  final List<dynamic> mdl;

   VisibleContainerForOrderScreen({
    super.key, required this.mdl,
  });
   final controller = sl<ClientController>();



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: Column(
        children: buildContainers(mdl)
      ),
    );
  }
}






List<Widget> buildContainers(List<dynamic> mdl) {
  return List.generate(mdl.length, (index) {
    return Container(
      margin: EdgeInsets.only(top: 1.w),
      height: 3.5.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(02.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 35.w,
            child: Center(
              child: Text(
                mdl[index].itemName,
                style: TextStyle(fontSize: 17.sp, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 25.w,
            child: Center(
              child: Text(
                '${mdl[index].quantity.toString()}X ${mdl[index].itemPrice.toString()}',
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
            ),
          ),
          // SizedBox(
          //   width: 25.w,
          //   child: Center(
          //     child: Text(
          //       "X",
          //       style: TextStyle(fontSize: 14.sp, color: Colors.white),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   width: 25.w,
          //   child: Center(
          //     child: Text(
          //       ,
          //       style: TextStyle(fontSize: 14.sp, color: Colors.white),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  });
}




// [
// SizedBox(
// height: 0.5.h,
// ),
// Container(
// height: 3.5.h,
// width: 80.w,
// decoration: BoxDecoration(
// color: Colors.grey,
// borderRadius: BorderRadius.circular(02.w),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// SizedBox(
// width: 35.w,
// child: Center(
// child: Text(
// 'Bergers',
// style: TextStyle(fontSize: 17.sp, color: Colors.white),
// ),
// ),
// ),
// SizedBox(
// width: 25.w,
// child: Center(
// child: Text(
// targetOne,
// style: TextStyle(fontSize: 17.sp, color: Colors.white),
// ),
// ),
// ),
// ],
// ),
// ),
// SizedBox(
// height: 0.5.h,
// ),
// Container(
// height: 3.5.h,
// width: 80.w,
// decoration: BoxDecoration(
// color: Colors.grey,
// borderRadius: BorderRadius.circular(02.w),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// SizedBox(
// width: 35.w,
// child: Center(
// child: Text(
// 'Cheese Bergers',
// style: TextStyle(fontSize: 17.sp, color: Colors.white),
// ),
// ),
// ),
// SizedBox(
// width: 25.w,
// child: Center(
// child: Text(
// targetOne,
// style: TextStyle(fontSize: 17.sp, color: Colors.white),
// ),
// ),
// ),
// ],
// ),
// ),
// SizedBox(
// height: 0.5.h,
// ),
// Container(
// height: 3.5.h,
// width: 80.w,
// decoration: BoxDecoration(
// color: Colors.grey,
// borderRadius: BorderRadius.circular(02.w),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// SizedBox(
// width: 35.w,
// child: Center(
// child: Text(
// 'Pizza',
// style: TextStyle(fontSize: 17.sp, color: Colors.white),
// ),
// ),
// ),
// SizedBox(
// width: 25.w,
// child: Center(
// child: Text(
// targetOne,
// style: TextStyle(fontSize: 17.sp, color: Colors.white),
// ),
// ),
// ),
// ],
// ),
// ),
//
//
// SizedBox(height: 2.h,)
//
//
//
//
// ],