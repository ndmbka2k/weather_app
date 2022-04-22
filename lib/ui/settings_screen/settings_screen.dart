import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/repository/unit_repo.dart';
import 'package:weather_app/ui/components/appbar_custom.dart';
import 'package:weather_app/ui/components/background_body.dart';
import 'package:weather_app/ui/home_screen/home_screen.dart';

import '../../bloc/unit/unit_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late UnitCubit _cubit;
  late List cubitTitle;
  late List cubitUnit;

  @override
  void initState() {
    // TODO: implement initState
    _cubit = BlocProvider.of<UnitCubit>(context);
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarCustom(title: 'Settings'),
            Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
              child: Text(
                'UNIT',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
              ),
            ),
            BlocConsumer<UnitCubit, UnitState>(
              listener: (context, state) {},
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    String dropdownvalue = '';
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            state.titleList![index],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: primaryColor),
                          ),
                        ),
                        DropdownButton<String>(
                          value: index == 0
                              ? state.temperUnit
                              : index == 1
                                  ? state.speedUnit
                                  : state.pressureUnit,
                          // icon: Icon(
                          //   Icons.arrow_downward,
                          //   size: 0,
                          // ),
                          items: (state.unitList![index])
                              .map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffE0E0E0),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (index == 0) {
                              _cubit.changeTemperUnit(value!);
                              dropdownvalue = state.temperUnit;
                              print(dropdownvalue);
                            }
                            if (index == 1) {
                              _cubit.changeSpeedUnit(value!);
                              dropdownvalue = state.speedUnit;
                              print('change1');
                            }
                            if (index == 2) {
                              _cubit.changePressureUnit(value!);
                              dropdownvalue = state.temperUnit;
                            }
                          },
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 14,
                    );
                  },
                  itemCount: measureUnit.length,
                );
              },
            ),
            Divider(
              height: 64,
              thickness: 1,
              color: primaryColor,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MoreInfor(
                    title: moreInfor[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16,
                  );
                },
                itemCount: moreInfor.length)
          ],
        ),
      ),
    );
  }
}

class MoreInfor extends StatelessWidget {
  const MoreInfor({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
    );
  }
}

List moreInfor = ['EXTRA', 'About', 'Privacy policy'];

List measureUnit = [
  [
    'Temperature unit',
    ['°C', '°K']
  ],
  [
    'Wind speed unit',
    ['km/h']
  ],
  [
    'Atmospheric pressure unit',
    ['mbar']
  ]
];

class MeasuredUnit extends StatefulWidget {
  const MeasuredUnit({Key? key, required this.title, required this.unit})
      : super(key: key);

  final String title;
  final List<String> unit;

  @override
  State<MeasuredUnit> createState() => _MeasuredUnitState();
}

class _MeasuredUnitState extends State<MeasuredUnit> {
  String dropdownValue = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = widget.unit[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: primaryColor),
          ),
        ),
        DropdownButton<String>(
          value: dropdownValue,
          // icon: Icon(
          //   Icons.arrow_downward,
          //   size: 0,
          // ),
          items: widget.unit.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffE0E0E0),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              dropdownValue = value!;
            });
          },
        )
      ],
    );
  }
}
