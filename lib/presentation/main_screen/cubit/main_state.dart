abstract class PinCodeState {}

class InitialPinCodeState extends PinCodeState{}

class LoadingPinCodeState extends PinCodeState{}


class SuccessLoadedPinCodeState extends PinCodeState{
  SuccessLoadedPinCodeState(this.pinCode);

  final String pinCode;
}

class ErrorPinCodeState extends PinCodeState {
  ErrorPinCodeState(this.error);

  final Object error;
}