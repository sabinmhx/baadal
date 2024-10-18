import 'package:baadal/controller/home_controller.dart';
import 'package:baadal/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevelWidget extends StatelessWidget {
  const ComfortLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final weatherDataCurrent = controller.weatherData.value?.current;

    return Column(
      children: [
        Text("Comfort Level", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
        Column(
          children: [
            SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue:
                  weatherDataCurrent?.current.humidity?.toDouble() ?? 0.0,
              appearance: CircularSliderAppearance(
                size: 140,
                customWidths: CustomSliderWidths(
                  handlerSize: 0,
                  trackWidth: 12,
                  progressBarWidth: 12,
                ),
                infoProperties: InfoProperties(
                  bottomLabelText: "Humidity",
                  mainLabelStyle:
                      Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColor.secondaryText,
                          ),
                  bottomLabelStyle: Theme.of(context).textTheme.labelLarge,
                ),
                animationEnabled: true,
                customColors: CustomSliderColors(
                  hideShadow: true,
                  trackColor: AppColor.firstGradientColor.withAlpha(100),
                  progressBarColors: [
                    AppColor.firstGradientColor,
                    AppColor.secondGradientColor
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Feels Like ",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      TextSpan(
                        text: "${weatherDataCurrent?.current.feelsLike}",
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "UV Index ",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextSpan(
                      text: "${weatherDataCurrent?.current.uvIndex}",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ]),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
