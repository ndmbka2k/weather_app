import 'package:weather_app/bloc/weather_data/weather_state.dart';
import 'package:weather_app/models/load_status.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/repository/weather_repo.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherRepo weatherRepo;
  WeatherCubit(this.weatherRepo) : super(WeatherState());

  Future<void> init() async {
    emit(state.copyWith(loadStatus: LoadStatus.LOADING));
    try {
      final result = await weatherRepo.getDetailWeather();
      if (result != null) {
        emit(state.copyWith(
            loadStatus: LoadStatus.SUCCESS, weatherData: result));
      }
    } catch (e) {}
  }

  void showMore() {
    emit(state.copyWith(isLarge: true));
  }
}
