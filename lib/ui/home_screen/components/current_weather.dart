import 'package:flutter/material.dart';
import 'package:weather_app/ui/home_screen/components/current_forcast.dart';

import '../../../constants/colors/app_colors.dart';
import '../../detail_section.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    Key? key,
    required this.islarge,
    required this.temper,
    required this.imageUrl,
    required this.desTitle,
    required this.windSpeed,
    required this.pressure,
    required this.humidity,
    required this.pop,
  }) : super(key: key);

  final bool islarge;
  final int temper;
  final String imageUrl;
  final String desTitle;
  final double windSpeed;
  final int pressure;
  final int humidity;
  final double pop;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        islarge
            ? CurrentForcastCol(
                temper: temper,
                imageUrl: 'http://openweathermap.org/img/wn/$imageUrl@2x.png',
                title: desTitle,
              )
            : CurrentForcastRow(
                temper: temper,
                imageUrl: 'http://openweathermap.org/img/wn/$imageUrl@2x.png',
                title: desTitle,
              ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          height: 1,
          color: AppColor.primaryColor,
        ),
        Container(
          padding: EdgeInsets.only(left: 22, bottom: 24),
          child: Row(
            children: [
              Expanded(
                child: DetailSection(
                  image: Image.asset('assets/images/location.png'),
                  measureUnit: '$windSpeed km/h',
                  subTitle: 'Wind',
                ),
              ),
              Expanded(
                child: DetailSection(
                  image: Image.asset('assets/images/weather.png'),
                  measureUnit: '$pop%',
                  subTitle: 'Chance of rain',
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 22,
          ),
          child: Row(
            children: [
              Expanded(
                child: DetailSection(
                  image: Image.asset('assets/images/pressure.png'),
                  measureUnit: '$pressure mbar',
                  subTitle: 'Pressure',
                ),
              ),
              Expanded(
                child: DetailSection(
                  image: Image.asset('assets/images/humidity.png'),
                  measureUnit: '$humidity%',
                  subTitle: 'Humidity',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
