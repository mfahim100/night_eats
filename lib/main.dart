import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:night_eats/UI/screens/auth_screens/login_screen.dart';
import 'package:night_eats/UI/screens/home_screens/condition_and_terms.dart';
import 'package:night_eats/UI/screens/home_screens/contact_us_screen.dart';
import 'package:night_eats/UI/screens/home_screens/location_screen.dart';
import 'package:night_eats/UI/screens/home_screens/order_screen.dart';
import 'package:night_eats/UI/screens/home_screens/our_products_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'UI/screens/auth_screens/acount_verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context , orientation , screenType ) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:
            // const ConditionAndTerms()
            // const ContactUsScreen()
            // const OurProductsScreen()
            // LocationScreen()
            const OrderScreen()
            // const AccountVerificationScreen()
            // const LoginScreen()
        );
      },

    );
  }
}


