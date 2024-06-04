import 'package:flutter/material.dart';
import 'injections.dart' as di;

class MainMethod{
  static Future<void> init () async {

    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
  }
}