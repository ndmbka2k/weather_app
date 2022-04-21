import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/colors/app_colors.dart';

import '../../../models/weather_data.dart';
import '../../temperbound.dart';

class DailyWeather extends StatelessWidget {
  const DailyWeather(
      {Key? key, required this.dailyWeather, required this.isLoading})
      : super(key: key);

  final List? dailyWeather;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 16),
      color: Color(0xff2c79c1),
      child: isLoading
          ? Container()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16, right: 24),
                  child: Text(
                    'Forcats for 7 Days',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 8),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    Daily temp = dailyWeather![index];
                    return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 15,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                DateFormat('E').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        temp.dt * 1000)),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      'http://openweathermap.org/img/wn/${temp.weather[0].icon}@2x.png',
                                      height: 24,
                                      width: 24,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${temp.pop}% rain',
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: TemperBound(
                                  lower: temp.temp.min,
                                  upper: temp.temp.max,
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                )
              ],
            ),
    );
  }
}
