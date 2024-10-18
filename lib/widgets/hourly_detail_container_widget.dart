import 'package:flutter/material.dart';
import 'package:baadal/utils/app_color.dart';
import 'package:baadal/utils/date_time_format.dart';

class HourlyDetailContainerWidget extends StatelessWidget {
  final int temp;
  final int timeStamp;
  final String weatherIcon;

  const HourlyDetailContainerWidget({
    super.key,
    required this.timeStamp,
    required this.temp,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.5, 0),
            blurRadius: 30,
            spreadRadius: 1,
            color: AppColor.card.withAlpha(150),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            DateTimeFormat.getTime(timeStamp),
            style: const TextStyle(
              color: AppColor.primaryText,
            ),
          ),
          Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
          Text(
            "$temp°",
            style: const TextStyle(
              color: AppColor.primaryText,
            ),
          )
        ],
      ),
    );
  }
}
