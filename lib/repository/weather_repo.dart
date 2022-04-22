import 'package:weather_app/networks/api_client.dart';

import '../models/weather_data.dart';

class WeatherRepo {
  late ApiClient apiClient;

  WeatherRepo(this.apiClient);

  Future<WeatherData> getDetailWeather() async {
    return await apiClient.getDetailWeather();
  }
}
