import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baadal/controller/home_controller.dart';
import 'package:baadal/utils/date_time_format.dart';

class DailyWeatherDataWidget extends StatelessWidget {
  const DailyWeatherDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final weatherDataDaily = controller.weatherData.value?.daily;
    return Column(
      children: [
        Text("Next Days", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: (weatherDataDaily?.daily != null &&
                    weatherDataDaily!.daily.length > 7)
                ? 7
                : weatherDataDaily?.daily.length ?? 0,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      DateTimeFormat.getDay(weatherDataDaily?.daily[index].dt),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Image.asset(
                      "assets/weather/${weatherDataDaily?.daily[index].weather![0].icon}.png",
                      height: 30,
                      width: 30,
                    ),
                    Text(
                      "${weatherDataDaily?.daily[index].temp!.max}°/${weatherDataDaily?.daily[index].temp!.min}",
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
