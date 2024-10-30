import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_update/controller/theme_controller.dart';
import 'package:weather_update/screen/components/screen_components.dart';
import 'package:weather_update/service/weather_service.dart';

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({super.key});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  final WeatherService service = WeatherService();
  final ThemeController themeController = Get.find();

  @override
  void initState() {
    super.initState();
    _loadWeatherData(); // Fetch data when initializing
  }

  Future<void> _loadWeatherData() async {
    await service.fetchWeather();
    setState(() {}); // Update UI after data is fetched
  }

  @override
  Widget build(BuildContext context) {
    var data = service.finalData;
    return Scaffold(
        extendBody: true,
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
        body: service.finalData != null
            ? ScreenComponents(
                name: data!.name,
                temperature: data.main.temp.toStringAsFixed(2),
                weatherState: data.weather[0].main.toString(),
                wind: data.wind.speed.toString(),
                tempMax: data.main.tempMax.toStringAsFixed(2),
                tempMin: data.main.tempMin.toStringAsFixed(2),
                humidity: data.main.humidity.toString(),
                pressure: data.main.pressure.toString(),
                seaLevel: data.main.seaLevel.toString(),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
