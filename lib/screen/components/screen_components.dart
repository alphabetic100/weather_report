import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScreenComponents extends StatelessWidget {
  ScreenComponents(
      {super.key,
      required this.name,
      required this.temperature,
      required this.weatherState,
      required this.wind,
      required this.tempMax,
      required this.tempMin,
      required this.humidity,
      required this.pressure,
      required this.seaLevel});
  final String name;
  final String temperature;
  final String weatherState;
  final String wind;
  final String tempMax;
  final String tempMin;
  final String humidity;
  final String pressure;
  final String seaLevel;
  final String dateFormate =
      DateFormat("EEEE dd, MMMM yyyy").format(DateTime.now());
  final String timeFormate = DateFormat("hh:mm a").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            "$temperature°C",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            weatherState,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          // Date and time segment
          Text(
            dateFormate,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            timeFormate,
            style: const TextStyle(fontSize: 20),
          ),

          SizedBox(
            height: Get.height * 0.3,
            child: Icon(
              Icons.wb_cloudy_sharp,
              size: Get.height * 0.3,
            ),
          ),
          Container(
            height: Get.height * 0.3,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green.shade300),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //that colums defines wind speed
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wind_power_rounded,
                            size: 20,
                          ),
                          Text(
                            "${wind}km/h",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text("Wind"),
                        ],
                      ),
                      // that column defines max temperature
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wb_sunny,
                            size: 20,
                          ),
                          Text(
                            "$tempMax°C",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text("Max Temp"),
                        ],
                      ),
                      // this column defines minimum temperature
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.ac_unit,
                            size: 20,
                          ),
                          Text(
                            "$tempMin°C",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text("Min Temp"),
                        ],
                      )
                    ],
                  ),
                  //
                  const Divider(
                    thickness: 3,
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //that colums defines Humidity
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.water_drop,
                            size: 25,
                            color: Colors.amber,
                          ),
                          Text(
                            "$humidity%",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text("Humidity"),
                        ],
                      ),
                      // that column defines pressure
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.speed,
                            size: 25,
                            color: Colors.amber,
                          ),
                          Text(
                            "${pressure}hPa",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text("Pressure"),
                        ],
                      ),
                      // this column defines Sea-Level
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.water,
                            size: 25,
                            color: Colors.amber,
                          ),
                          Text(
                            "${seaLevel}m",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text("Sea-Level"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
