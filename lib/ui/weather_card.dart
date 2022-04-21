import 'package:flutter/material.dart';

import '../models/weather_data.dart';
import 'home_screen/home_screen.dart';
import 'temperature.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(
    this.weather, {
    Key? key,
  }) : super(key: key);

  final Current weather;

  @override
  Widget build(BuildContext context) {
    String time = '';
    var date = DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000);
    if (date.hour == DateTime.now().hour) {
      time = 'Now';
    } else {
      time = DateFormat('HH:mm').format(date);
    }

    return Container(
      height: 104,
      width: 72,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Text(
            time,
            style: TextStyle(
              color: primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(top: 9, bottom: 4),
            child: Image.network(
              'http://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 14,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Temperature(
                  temp: weather.temp.round(),
                ),
                Text(
                  '/',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Temperature(temp: weather.feelsLike.round()),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${weather.pop.toStringAsFixed(2)}% rain',
            style: TextStyle(
              color: primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
