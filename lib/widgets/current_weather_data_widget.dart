import 'package:baadal/controller/home_controller.dart';
import 'package:baadal/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentWeatherDataWidget extends StatelessWidget {
  const CurrentWeatherDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final weatherDataCurrent = controller.weatherData.value?.current;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              height: 80,
              width: 80,
              "assets/weather/${weatherDataCurrent?.current.weather![0].icon}.png",
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.cloud),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "${weatherDataCurrent?.current.temp!.toInt()}°",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                TextSpan(
                  text:
                      "${weatherDataCurrent?.current.weather![0].description}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColor.secondaryText),
                ),
              ]),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMoreDetailsWidget(
              context: context,
              imageUrl: "assets/icons/windspeed.png",
              data: "${weatherDataCurrent?.current.windSpeed}km/h",
            ),
            _buildMoreDetailsWidget(
              context: context,
              imageUrl: "assets/icons/clouds.png",
              data: "${weatherDataCurrent?.current.clouds}km/h",
            ),
            _buildMoreDetailsWidget(
              context: context,
              imageUrl: "assets/icons/humidity.png",
              data: "${weatherDataCurrent?.current.humidity}km/h",
            ),
          ],
        )
      ],
    );
  }

  Widget _buildMoreDetailsWidget(
      {String? imageUrl, String? data, required BuildContext context}) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.card,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(imageUrl ?? ''),
        ),
        const SizedBox(height: 10),
        Text(data ?? '', style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
