import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

class DetailSection extends StatelessWidget {
  const DetailSection(
      {Key? key,
      required this.image,
      required this.measureUnit,
      required this.subTitle})
      : super(key: key);

  final Image image;
  final String measureUnit;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image,
        SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              measureUnit,
              style: TextStyle(
                color: primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        )
      ],
    );
  }
}
