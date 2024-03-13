import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/presentation/main_screen/cubit/pin_code_state.dart';

class PinCodeCubit extends Cubit<PinCodeState> {
  PinCodeCubit({
    required this.repository,
  }) : super(InitialPinCodeState());

  final WelTradeRepository repository;

  Future<void> setPinCode(String pinCode) async {
    try {
      await repository.savePinCode(pinCode);
    } catch (error) {
      emit(ErrorPinCodeState(error));
    }
  }

  Future<void> setSkipForDay(bool value) async {
    try {
      await repository.setSkipForDay(value);
    } catch (error) {
      emit(ErrorPinCodeState(error));
    }
  }

  Future<void> setSkipForever(bool value) async {
    try {
      await repository.setSkipForever(value);
    } catch (error) {
      emit(ErrorPinCodeState(error));
    }
  }

  Future<void> setSkipForDayDate(String value) async {
    try {
      await repository.setSkipForDayDate(value);
    } catch (error) {
      emit(ErrorPinCodeState(error));
    }
  }

  Future<bool> getSkipForDay() async {
    try {
      final bool skipForDay = await repository.getSkipForDay();
      return skipForDay;
    } catch (error) {
      emit(ErrorPinCodeState(error));
      return false;
    }
  }

  Future<bool> getSkipForever() async {
    try {
      final bool skipForever = await repository.getSkipForever();
      return skipForever;
    } catch (error) {
      emit(ErrorPinCodeState(error));
      return true;
    }
  }

  Future<String?> getSkipForDayDate() async {
    try {
      final String? skipForDayDate = await repository.getSkipForDayDate();
      return skipForDayDate;
    } catch (error) {
      emit(ErrorPinCodeState(error));
    }
    return null;

  }


}
