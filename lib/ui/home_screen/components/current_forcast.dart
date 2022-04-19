import 'package:flutter/material.dart';

import '../../weather_overview.dart';

class CurrentForcastRow extends StatelessWidget {
  const CurrentForcastRow({
    Key? key,
    required this.imageUrl,
    required this.temper,
    required this.title,
  }) : super(key: key);

  final int temper;

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 160,
          width: 160,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        WeatherOverview(
          temp: temper,
          title: title,
        ),
      ],
    );
  }
}

class CurrentForcastCol extends StatelessWidget {
  const CurrentForcastCol({
    Key? key,
    required this.temper,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  final int temper;

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 240,
          width: 240,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        WeatherOverview(
          temp: temper,
          title: title,
        ),
      ],
    );
  }
}
