import 'package:flutter/material.dart';

class Swiper extends StatelessWidget {
  const Swiper({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: Color(0xffffffff),
        ),
      ),
      height: 8,
      width: 8,
    );
  }
}
