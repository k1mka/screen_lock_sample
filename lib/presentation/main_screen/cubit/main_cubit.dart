import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/presentation/main_screen/cubit/main_state.dart';
import 'package:screen_lock/templates/request_permision_template.dart';

class PinCodeCubit extends Cubit<PinCodeState> with RequestPermissionsTemplateMixin{
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

  Future<void> getRemoteValue() async {
    try{
      await repository.initRemoteConfig();
      bool shouldShowFeature =
      FirebaseRemoteConfig.instance.getBool("is_request_active");
      if (shouldShowFeature) requestTrackActivityPermission();
    } catch (error){
      emit(ErrorPinCodeState(error));
    }
  }
}