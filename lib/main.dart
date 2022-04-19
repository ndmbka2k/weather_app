import 'package:flutter/material.dart';
import 'package:weather_app/ui/manage_location_screen/manage_screen.dart';
import 'package:weather_app/ui/settings_screen/settings_screen.dart';

import 'ui/home_screen/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        'home_screen': (context) => const HomeScreen(),
        'manage_screen': (context) => const ManageScreen(),
        'settings_screen': (context) => const SettingsScreen()
      },
    );
  }
}
