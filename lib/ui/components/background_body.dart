import 'package:flutter/material.dart';

class BackgroundBody extends StatelessWidget {
  const BackgroundBody({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 766,
        padding: EdgeInsets.only(top: 23, left: 16, right: 16),
        margin: EdgeInsets.only(left: 16, right: 16, top: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2c79c1), Color(0xff62b8f6)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: child);
  }
}
