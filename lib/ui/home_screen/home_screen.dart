import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_data/weather_cubit.dart';
import 'package:weather_app/bloc/weather_data/weather_state.dart';
import 'package:weather_app/models/load_status.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/networks/api_client.dart';
import 'package:weather_app/repository/weather_repo.dart';

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
  bool islarge = true;
  bool isLoading = false;
  late WeatherCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<WeatherCubit>(context);
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocConsumer<WeatherCubit, WeatherState>(
              bloc: BlocProvider.of<WeatherCubit>(context),
              listenWhen: (prev, state) => prev != state,
              listener: (context, state) {},
              buildWhen: (prev, state) => prev != state,
              builder: (context, state) {
                return Container(
                  height: state.isLarge ? 353 : 565,
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
                      HomeAppBar(name: 'HaNoi'),
                      state.loadStatus == LoadStatus.LOADING
                          ? Container()
                          : CurrentWeather(
                              islarge: state.isLarge,
                              imageUrl:
                                  // state.weatherData.weather[0].icon.toString(),
                                  state.weatherData!.current.weather[0].icon
                                      .toString(),
                              desTitle:
                                  state.weatherData!.current.weather[0].main,
                              temper: (state.weatherData!.current.temp).round(),
                              windSpeed: state.weatherData!.current.windSpeed,
                              pressure: state.weatherData!.current.pressure,
                              humidity: state.weatherData!.current.humidity,
                              pop: state.weatherData!.current.pop,
                            ),
                    ],
                  ),
                );
              },
            ),
            BlocBuilder<WeatherCubit, WeatherState>(
                bloc: BlocProvider.of<WeatherCubit>(context),
                buildWhen: (prev, state) =>
                    prev.weatherData != state.weatherData,
                builder: (context, state) {
                  return HourlyForcast(
                      isLoading: state.loadStatus == LoadStatus.LOADING,
                      hourlyWeather: state.weatherData?.hourly);
                }),
            BlocBuilder<WeatherCubit, WeatherState>(
              buildWhen: ((previous, current) =>
                  previous.isLarge != current.isLarge),
              builder: (context, state) {
                return state.isLarge
                    ? DailyWeather(
                        isLoading: state.loadStatus == LoadStatus.LOADING,
                        dailyWeather: state.weatherData?.daily)
                    : InkWell(
                        onTap: () {
                          print(state.isLarge);
                          _cubit.showMore();
                          print(state.isLarge);
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
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
