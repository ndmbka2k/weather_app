import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_data/weather_cubit.dart';
import 'package:weather_app/networks/api_client.dart';
import 'package:weather_app/repository/weather_repo.dart';
import 'package:weather_app/ui/manage_location_screen/manage_screen.dart';
import 'package:weather_app/ui/settings_screen/settings_screen.dart';

import 'ui/home_screen/home_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  ApiClient apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider<WeatherRepo>(
          create: (context) => WeatherRepo(apiClient),
          child: BlocProvider<WeatherCubit>(
              create: (context) =>
                  WeatherCubit(RepositoryProvider.of<WeatherRepo>(context)),
              child: const HomeScreen())),
      // routes: {
      //   'home_screen': (context) => const HomeScreen(),
      //   'manage_screen': (context) => const ManageScreen(),
      //   'settings_screen': (context) => const SettingsScreen()
      // },
    );
  }
}
