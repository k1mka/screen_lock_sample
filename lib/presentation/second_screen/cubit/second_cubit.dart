import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/presentation/second_screen/cubit/second_state.dart';

class SecondCubit extends Cubit<SecondState> {
  SecondCubit({
    required this.repository,
  }) : super(InitialSecondState());

  String? finalPinCode;
  final WelTradeRepository repository;

  Future<String?> getPinCode() async {
    try {
      emit(LoadingSecondCodeState());
      finalPinCode = await repository.getPinCode();
      if (finalPinCode != null) emit(SuccessLoadedSecondCodeState(finalPinCode!));
    } catch (error) {
      emit(ErrorSecondCodeState(error));
    }
    return finalPinCode;
  }
}
