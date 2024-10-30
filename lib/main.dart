import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_update/controller/theme_controller.dart';

import 'package:weather_update/screen/weather_details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final ThemeController themeController = Get.put(ThemeController());
  runApp(Obx(() => GetMaterialApp(
        theme: themeController.isDarkMode.value
            ? ThemeData.dark()
            : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const WeatherDetails();
  }
}
