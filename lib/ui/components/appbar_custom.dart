import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 32),
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Positioned(
            left: 0,
            top: 0,
            child: Image.asset('assets/icons/left_arrow.png'),
          ),
        ),
      ],
    );
  }
}
