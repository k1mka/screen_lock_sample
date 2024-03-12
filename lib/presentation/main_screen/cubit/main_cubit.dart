import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/presentation/main_screen/cubit/main_state.dart';

class PinCodeCubit extends Cubit<PinCodeState> {
  PinCodeCubit({
    required this.repository,
  }) : super(InitialPinCodeState());

  String? finalPinCode;
  final WelTradeRepository repository;

  Future<void> setPinCode(String pinCode) async {
    try {
      await repository.savePinCode(pinCode);
    } catch (error) {
      emit(ErrorPinCodeState(error));
    }
  }

  Future<String?> getPinCode() async {
    try {
      emit(LoadingPinCodeState());
      finalPinCode = await repository.getPinCode();
      if(finalPinCode != null) emit(SuccessLoadedPinCodeState(finalPinCode!));
    } catch (error) {
      emit(ErrorPinCodeState(error));
    }
    return finalPinCode;
  }
}