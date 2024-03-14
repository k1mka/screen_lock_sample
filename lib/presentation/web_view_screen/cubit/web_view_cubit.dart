import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/presentation/web_view_screen/cubit/web_view_state.dart';

class WebViewCubit extends Cubit<WebViewState> {
  WebViewCubit({required this.repository}) : super(WebViewInitialState());

  final WelTradeRepository repository;
}
