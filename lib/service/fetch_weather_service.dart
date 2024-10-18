import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:baadal/model/weather_data.dart';
import 'package:baadal/model/weather_data_current.dart';
import 'package:baadal/model/weather_data_daily.dart';
import 'package:baadal/model/weather_data_hourly.dart';

class FetchWeatherService extends GetxService {
  Future<WeatherData?> fetchWeatherData(double lat, double lon) async {
    const String apiKey = String.fromEnvironment('API_KEY', defaultValue: '');

    final String apiUrl =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonString = jsonDecode(response.body);

        final WeatherData weatherData = WeatherData(
          WeatherDataCurrent.fromJson(jsonString),
          WeatherDataHourly.fromJson(jsonString),
          WeatherDataDaily.fromJson(jsonString),
        );

        return weatherData;
      } else {
        log("Error: Received status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("Exception occurred: $e");
      return null;
    }
  }
}
