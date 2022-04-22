import 'package:weather_app/models/load_status.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:equatable/equatable.dart';

// class WeatherState extends Equatable {
//   LoadStatus? loadStatus;
//   WeatherData? weatherData;
//   bool isLarge;

//   WeatherState({this.loadStatus, this.weatherData, this.isLarge = false});

//   WeatherState copyWith({
//     LoadStatus? loadStatus,
//     WeatherData? weatherData,
//     bool? isLarge,
//   }) {
//     return WeatherState(
//       loadStatus: loadStatus ?? this.loadStatus,
//       weatherData: weatherData ?? this.weatherData,
//       isLarge: isLarge ?? this.isLarge,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         loadStatus,
//         weatherData,
//         isLarge,
//       ];
// }

class WeatherState {
  LoadStatus? loadStatus;
  WeatherData? weatherData;
  bool isLarge;

  WeatherState({this.loadStatus, this.weatherData, this.isLarge = false});

  WeatherState copyWith({
    LoadStatus? loadStatus,
    WeatherData? weatherData,
    bool? isLarge,
  }) {
    return WeatherState(
      loadStatus: loadStatus ?? this.loadStatus,
      weatherData: weatherData ?? this.weatherData,
      isLarge: isLarge ?? this.isLarge,
    );
  }
}
