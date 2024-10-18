import 'dart:developer';

import 'package:baadal/model/weather_data.dart';
import 'package:baadal/service/fetch_weather_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FetchWeatherService _fetchWeatherService =
      Get.put(FetchWeatherService());

  final RxBool _isDarkMode = RxBool(false);
  RxBool get isDarkMode => _isDarkMode;

  final RxBool _isLoading = RxBool(false);
  RxBool get isLoading => _isLoading;

  final RxString _city = "Loading...".obs;
  RxString get city => _city;

  final Rx<WeatherData?> weatherData = Rx<WeatherData>(WeatherData());

  final Rx<Position?> _currentPosition = Rx<Position?>(null);

  final RxString _locationErrorMessage = ''.obs;
  RxString get locationErrorMessage => _locationErrorMessage;

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  Future<void> getLocation() async {
    _isLoading.value = true;
    try {
      bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        await Geolocator.openLocationSettings();
        isServiceEnabled = await Geolocator.isLocationServiceEnabled();

        if (!isServiceEnabled) {
          _locationErrorMessage.value = "Please enable location services.";
          return;
        }
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        _locationErrorMessage.value =
            "Location permissions are permanently denied.";
        return;
      } else if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          _locationErrorMessage.value = "Location permissions are denied.";
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentPosition.value = position;

      _locationErrorMessage.value = '';

      await fetchWeather(position.latitude, position.longitude);
      await getCityFromCoordinates(position.latitude, position.longitude);
    } catch (e) {
      _locationErrorMessage.value = "Unable to fetch location.";
      log("Error: $e");
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> fetchWeather(double latitude, double longitude) async {
    try {
      weatherData.value =
          await _fetchWeatherService.fetchWeatherData(latitude, longitude);
    } catch (e) {
      log("Error: $e");
    }
  }

  Future<void> getCityFromCoordinates(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      _city.value = placemarks.isNotEmpty
          ? placemarks[0].locality ?? 'Unknown'
          : 'Unknown Location';
    } catch (e) {
      _city.value = "Unknown Location";
    }
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
