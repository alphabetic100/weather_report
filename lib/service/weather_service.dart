import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_update/model/weather_data.dart';

class WeatherService {
  final String url =
      "https://api.openweathermap.org/data/2.5/weather?lat=23.4498&lon=91.1847&appid=cf8bc6e2c3ade50a411be530f99b1d75";

  Future<WeatherData?> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return WeatherData.fromJson(jsonData); // Parse to WeatherData model
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
