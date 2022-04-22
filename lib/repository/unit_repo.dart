import 'package:flutter/cupertino.dart';

class UnitRepo {
  final List<String> _title = [
    'Temperature Unit',
    'Wind speed Unit',
    'Atmosphere pressure Unit'
  ];
  final List<String> _unitTemp = ['°C', '°K'];
  final List<String> _unitSpeed = ['km/h', 'm/s'];
  final List<String> _unitPressure = ['mbar', 'Pa'];

  List<String> get title => _title;
  List<List<String>> get unit => [_unitTemp, _unitSpeed, _unitPressure];
}
