import 'package:dio/dio.dart';
import 'package:flutter_movies/data/post/api.dart';

import 'package:flutter_movies/utils/preference_util.dart';
import 'package:flutter_movies/view/login/login_event.dart';
import 'package:flutter_movies/view/login/login_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class LoginBloc extends BaseBloc<LoginStateSuccess> {
  Api api;
  LoginBloc(this.api) : super(LoginStateSuccess());

  @override
  Stream<LoginStateSuccess> mapEventToState(BaseEvent event) async* {
    if (event is LoginButtonEvent) {
      yield state.copyWith(isLoading: true, isError: false);
      try {
        var result = await api.login(event.loginBody);

        if (result.success) {
          var session = await api
              .createSession(PreferenceUtils.getString('requestToken'));
          PreferenceUtils.setString('session_id', session.session_id);
          yield state.copyWith(
              isLoading: false, requestToken: result, isError: false);
        }
      } catch (e) {
        yield state.copyWith(isError: true, isLoading: false);
      }
    }
  }
}
