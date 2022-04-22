import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/repository/unit_repo.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitRepo unitRepo;

  UnitCubit(this.unitRepo) : super(UnitState());

  void init() {
    getTitle();
    getUnit();
    state.copyWith(temperUnit: state.unitList?[0][0]);
    state.copyWith(speedUnit: state.unitList?[1][0]);
    state.copyWith(pressureUnit: state.unitList?[2][0]);
  }

  void getTitle() => emit(state.copyWith(titleList: unitRepo.title));

  void getUnit() => emit(state.copyWith(unitList: unitRepo.unit));

  void changeTemperUnit(String tempUnit) {
    emit(state.copyWith(temperUnit: tempUnit));
  }

  void changeSpeedUnit(String speedUnit) {
    emit(state.copyWith(speedUnit: speedUnit));
  }

  void changePressureUnit(String pressureUnit) {
    emit(state.copyWith(pressureUnit: pressureUnit));
  }
}
