import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';
import 'temperbound.dart';

class WeatherLocation extends StatelessWidget {
  const WeatherLocation(
      {Key? key,
      required this.image,
      required this.imageTitle,
      required this.lower,
      required this.title,
      required this.upper})
      : super(key: key);

  final String title;
  final double lower;
  final double upper;
  final Image image;
  final String imageTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 19),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1b2541),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                TemperBound(
                  lower: lower,
                  upper: upper,
                  color: Color(0xff545b70),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  child: image,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  imageTitle,
                  style: TextStyle(
                    color: Color(0xff545b70),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
