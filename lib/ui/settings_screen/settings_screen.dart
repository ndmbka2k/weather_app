import 'package:flutter/material.dart';
import 'package:weather_app/ui/components/appbar_custom.dart';
import 'package:weather_app/ui/components/background_body.dart';
import 'package:weather_app/ui/home_screen/home_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MeasuredUnit(
                    title: measureUnit[index][0], unit: measureUnit[index][1]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 14,
                );
              },
              itemCount: measureUnit.length,
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
