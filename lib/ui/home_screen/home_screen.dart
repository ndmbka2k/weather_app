import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_data.dart';

import 'components/current_weather.dart';
import 'components/daily_weather.dart';
import 'components/home_appbar.dart';
import 'components/hourly_weather.dart';

Color primaryColor = const Color(0xffffffff);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentWether();
  }

  bool isLoading = true;

  late Current currentWeather;
  List hourlyWeather = [];
  List dailyWeather = [];
  String cityName = '';

  bool islarge = true;

  Future<void> getCurrentWether() async {
    var client = http.Client();
    try {
      var responseName = await client.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=20.997452&lon=105.8000156&appid=bc293085140fb725cafc937ad796a591&units=metric'));
      var response = await client.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/onecall?lat=20.997452&lon=105.8000156&exclude=minutely,alerts&appid=bc293085140fb725cafc937ad796a591&units=metric'));
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;

      Map<dynamic, dynamic> decodedResponseName =
          jsonDecode(utf8.decode(responseName.bodyBytes)) as Map;

      WeatherData weatherData =
          WeatherData.fromJson(decodedResponse as Map<String, dynamic>);

      setState(() {
        var temp = decodedResponseName['name'].toString();
        cityName = temp;
        currentWeather = weatherData.current;
        hourlyWeather = weatherData.hourly;
        dailyWeather = weatherData.daily;
        isLoading = false;
      });
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: islarge ? 565 : 353,
              width: 358,
              margin: const EdgeInsets.only(
                  top: 45, bottom: 16, left: 16, right: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff62B8F6), Color(0xff2C79C1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeAppBar(name: cityName),
                  isLoading
                      ? Container()
                      : CurrentWeather(
                          islarge: islarge,
                          imageUrl: currentWeather.weather[0].icon.toString(),
                          desTitle: currentWeather.weather[0].main,
                          temper: (currentWeather.temp).round(),
                          windSpeed: currentWeather.windSpeed,
                          pressure: currentWeather.pressure,
                          humidity: currentWeather.humidity,
                          pop: currentWeather.pop,
                        ),
                ],
              ),
            ),
            HourlyForcast(isLoading: isLoading, hourlyWeather: hourlyWeather),
            islarge
                ? InkWell(
                    onTap: () {
                      setState(() {
                        islarge = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Forcats for 7 Days',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff2C79C1),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Image.asset(
                            'assets/images/arrow_down.png',
                            height: 24,
                            width: 24,
                            color: Color(0xff2C79C1),
                          )
                        ],
                      ),
                    ),
                  )
                : DailyWeather(isLoading: isLoading, dailyWeather: dailyWeather)
          ],
        ),
      ),
    );
  }
}
