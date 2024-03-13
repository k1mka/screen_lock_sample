abstract class SecondState {}

class InitialSecondState extends SecondState{}

class LoadingSecondCodeState extends SecondState{}


class SuccessLoadedSecondCodeState extends SecondState{
  SuccessLoadedSecondCodeState(this.pinCode);

  final String pinCode;
}

class ErrorSecondCodeState extends SecondState {
  ErrorSecondCodeState(this.error);

  final Object error;
}