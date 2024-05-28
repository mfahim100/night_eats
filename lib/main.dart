import 'package:flutter/material.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:night_eats/UI/screens/auth_screens/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/utils/main_method.dart';

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
            home: const LoginScreen());
      },
    );
  }
}
