import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_update/model/weather_data.dart';

class WeatherService {
  WeatherResponse? finalData; // Ensure this has a correct type
  final String url =
      "https://api.openweathermap.org/data/2.5/weather?lat=23.450001&lon=91.199997&appid=cf8bc6e2c3ade50a411be530f99b1d75";

  Future<WeatherResponse?> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        finalData = WeatherResponse.fromJson(jsonData); // Set the finalData
        return finalData; // Return parsed weather data
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      Exception("Error fetching weather data: $e");
      return null; // Return null in case of an error
    }
  }
}
