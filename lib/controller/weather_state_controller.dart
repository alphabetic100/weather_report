import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_update/model/weather_data.dart';

class WeatherStateController extends GetxController {
  var weatherData = Rxn<WeatherData>(); // Observable for WeatherData model
  String url =
      "https://api.openweathermap.org/data/2.5/weather?lat=23.4498&lon=91.1847&appid=cf8bc6e2c3ade50a411be530f99b1d75";

  fetchWeather() async {
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        weatherData.value = WeatherData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      print(e);
    }
  }
}
