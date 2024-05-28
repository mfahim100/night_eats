import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{


  final scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt tabIndex=0.obs;

  setTabIndex(int val){

    tabIndex.value=val;
    if (scaffoldKey.currentState!.isEndDrawerOpen == true) {

      scaffoldKey.currentState!.closeEndDrawer();
    }
  }

}