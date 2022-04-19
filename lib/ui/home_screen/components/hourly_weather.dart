import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/colors/app_colors.dart';

import '../../weather_card.dart';

class HourlyForcast extends StatelessWidget {
  const HourlyForcast({
    Key? key,
    required this.isLoading,
    required this.hourlyWeather,
  }) : super(key: key);

  final bool isLoading;
  final List? hourlyWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 390,
      padding: EdgeInsets.only(
        top: 9,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: Color(0xff2c79c1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                DateFormat('EEEE').format(DateTime.now()),
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                color: AppColor.primaryColor,
                height: 19,
                width: 2,
              ),
              Text(
                DateFormat('MMM d').format(DateTime.now()),
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          isLoading
              ? Container()
              : Container(
                  height: 104,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (hourlyWeather == null) {
                        return Container();
                      } else {
                        return WeatherCard(hourlyWeather![index]);
                      }
                    },
                    itemCount: 23,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
        ],
      ),
    );
  }
}
