import 'package:flutter/material.dart';

import 'temperature.dart';

class TemperBound extends StatelessWidget {
  const TemperBound(
      {Key? key,
      this.color = Colors.white,
      required this.lower,
      required this.upper})
      : super(key: key);

  final Color color;
  final double lower;
  final double upper;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Temperature(
          temp: lower.round(),
          color: color,
        ),
        Text(
          '/',
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Temperature(
          temp: upper.round(),
          color: color,
        ),
      ],
    );
  }
}
