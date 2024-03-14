import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/presentation/login_screen/cubit/login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(LoginInitialState());

  final WelTradeRepository repository;

}

