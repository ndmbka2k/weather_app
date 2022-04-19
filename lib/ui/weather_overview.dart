import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';
import 'package:intl/intl.dart';

class WeatherOverview extends StatelessWidget {
  const WeatherOverview({Key? key, required this.temp, required this.title})
      : super(key: key);

  final int temp;

  final String title;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('EEEE').format(date),
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 11),
              color: primaryColor,
              height: 19,
              width: 2,
            ),
            Text(
              DateFormat('MMM d').format(date),
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Container(
          height: 86,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                temp.toString(),
                style: TextStyle(
                  fontSize: 72,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment(1, -0.7),
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
