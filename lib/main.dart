

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/utils/main_method.dart';
import 'features/admin/main_admin/presentation/pages/admin_home_screen.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/client/presentation/pages/client_home_screen.dart';
import 'features/delivery/presentation/pages/delivery_home_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  await MainMethod.init();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            smartManagement: SmartManagement.full,
            title: 'Night Eats',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:
             const LoginScreen(),
            // const AdminHomeScreen(),
            //     const DeliveryHomeScreen(),
          // ClientHomeScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
