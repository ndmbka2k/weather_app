import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

class Temperature extends StatelessWidget {
  const Temperature({Key? key, required this.temp, this.color = Colors.white})
      : super(key: key);

  final int temp;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            temp.toString(),
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w400,
            ),
          ),
          Align(
            alignment: Alignment(1, -0.7),
            child: Container(
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: color,
                  width: 1,
                ),
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
