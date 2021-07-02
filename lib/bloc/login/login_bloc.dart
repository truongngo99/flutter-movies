import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/login/login_event.dart';
import 'package:flutter_movies/bloc/login/login_state.dart';

import 'package:flutter_movies/models/authentication/request_token.dart';

import 'package:flutter_movies/network/api.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //final RequestToken? requestToken;
  LoginBloc() : super(LoginLoading());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonEvent) {
      bool check = false;
      await ApiClient(Dio()).login(event.loginBody).then((value) {
        if (value.success) {
          check = value.success;
        }
      });
      if (check) {
        yield LoginSuccess();
      } else
        yield LoginFailed();
    }
  }
}
