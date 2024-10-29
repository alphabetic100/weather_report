import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_update/controller/theme_controller.dart';
import 'package:weather_update/controller/weather_state_controller.dart';

class WeatherDetails extends StatelessWidget {
  WeatherDetails({super.key});
  final WeatherStateController controller = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Weather Update",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: themeController.toggleTheme,
              child: Obx(() => Icon(
                    themeController.isDarkMode.value
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
          )
        ],
      ),
      body: Obx(() {
        if (controller.weatherData.value == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final weather = controller.weatherData.value!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "City: ${weather.name}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Temperature: ${weather.main.temp}°C",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "Weather: ${weather.weather[0].description}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
