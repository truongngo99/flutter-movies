import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/login/login_event.dart';
import 'package:flutter_movies/bloc/login/login_state.dart';

import 'package:flutter_movies/models/authentication/request_token.dart';

import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/utils/preference_util.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginLoading());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonEvent) {
      try {
        var result = await ApiClient(Dio()).login(event.loginBody);

        if (result.success) {
          var session = await ApiClient(Dio())
              .createSession(PreferenceUtils.getString('requestToken'));
          PreferenceUtils.setString('session_id', session.session_id);

          yield LoginSuccess();
        }
      } catch (e) {
        final res = (e as DioError).response!.data['success'];

        if (!res) {
          yield LoginFailed();
        }
        yield LoginLoading();
      }
    }
  }
}
