import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baadal/controller/home_controller.dart';
import 'package:baadal/model/weather_data_hourly.dart';
import 'package:baadal/widgets/hourly_detail_container_widget.dart';

class HourlyWeatherDataWidget extends StatelessWidget {
  const HourlyWeatherDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final WeatherDataHourly? weatherDataHourly =
        controller.weatherData.value?.hourly;

    return Column(
      children: [
        Text("Today", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (weatherDataHourly?.hourly != null &&
                    weatherDataHourly!.hourly.length > 12)
                ? 12
                : weatherDataHourly?.hourly.length ?? 0,
            itemBuilder: (context, index) {
              return HourlyDetailContainerWidget(
                temp: weatherDataHourly?.hourly[index].temp ?? 0,
                timeStamp: weatherDataHourly?.hourly[index].dt ?? 0,
                weatherIcon:
                    weatherDataHourly?.hourly[index].weather![0].icon ?? '',
              );
            },
          ),
        ),
      ],
    );
  }
}
