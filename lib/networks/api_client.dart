import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_data.dart';

class ApiClient {
  Future<WeatherData> getDetailWeather() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/onecall?lat=20.997452&lon=105.8000156&exclude=minutely,alerts&appid=bc293085140fb725cafc937ad796a591&units=metric'));
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;

      WeatherData weatherData =
          WeatherData.fromJson(decodedResponse as Map<String, dynamic>);

      return weatherData;
    } finally {
      client.close();
    }
  }
}
