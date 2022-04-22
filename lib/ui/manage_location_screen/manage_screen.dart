import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_data/weather_cubit.dart';

import '../components/appbar_custom.dart';
import '../components/background_body.dart';
import '../location_weather.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({Key? key}) : super(key: key);

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  late WeatherCubit _cubit;

  @override
  void initState() {
    // TODO: implement initState

    _cubit = BlocProvider.of<WeatherCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarCustom(
              title: 'Manage Location',
            ),
            Container(
              height: 32,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Image.asset(
                      'assets/icons/search.png',
                      width: 4,
                      height: 4,
                    ),
                  ),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  fillColor: Color(0xfff2f2f2),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: 'Search Your City',
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return weather_location[index];
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
                itemCount: weather_location.length),
          ],
        ),
      ),
    );
  }
}

List weather_location = [
  WeatherLocation(
    title: 'Malang',
    upper: 24,
    lower: 20,
    image: Image.asset('assets/images/heavy_rain.png'),
    imageTitle: 'Heavy Rain',
  ),
  WeatherLocation(
    title: 'Banyuwangi',
    upper: 26,
    lower: 22,
    image: Image.asset('assets/images/heavy_rain.png'),
    imageTitle: 'Heavy Rain',
  ),
  WeatherLocation(
    title: 'Jakarta',
    upper: 28,
    lower: 27,
    image: Image.asset('assets/images/cloudy.png'),
    imageTitle: 'Cloudy',
  )
];
