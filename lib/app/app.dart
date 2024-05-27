import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/resources/routes_manager.dart';
import '../utilities/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: getPages,
      theme: getApplicationTheme(),
    );
  }
}
