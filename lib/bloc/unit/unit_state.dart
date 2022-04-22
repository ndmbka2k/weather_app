part of 'unit_cubit.dart';

class UnitState extends Equatable {
  String temperUnit;
  String speedUnit;
  String pressureUnit;
  List<String>? titleList;
  List<List<String>>? unitList;

  UnitState({
    this.pressureUnit = '',
    this.speedUnit = '',
    this.temperUnit = '',
    this.titleList,
    this.unitList,
  });

  UnitState copyWith(
      {String? temperUnit,
      String? speedUnit,
      String? pressureUnit,
      List<String>? titleList,
      List<List<String>>? unitList}) {
    return UnitState(
        temperUnit: temperUnit ?? this.temperUnit,
        speedUnit: speedUnit ?? this.speedUnit,
        pressureUnit: pressureUnit ?? this.pressureUnit,
        titleList: titleList ?? this.titleList,
        unitList: unitList ?? this.unitList);
  }

  @override
  get props => [
        temperUnit,
        speedUnit,
        pressureUnit,
        unitList,
        titleList,
      ];
}
