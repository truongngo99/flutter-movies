import 'package:dio/dio.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/utils/preference_util.dart';
import 'package:flutter_movies/view/login/login_event.dart';
import 'package:flutter_movies/view/login/login_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class LoginBloc extends BaseBloc<LoginStateSuccess> {
  LoginBloc() : super(LoginStateSuccess());

  @override
  Stream<LoginStateSuccess> mapEventToState(BaseEvent event) async* {
    if (event is LoginButtonEvent) {
      yield state.copyWith(isLoading: true, isError: false);
      try {
        var result = await ApiClient(Dio()).login(event.loginBody);
        print('18');
        if (result.success) {
          var session = await ApiClient(Dio())
              .createSession(PreferenceUtils.getString('requestToken'));
          PreferenceUtils.setString('session_id', session.session_id);
          yield state.copyWith(
              isLoading: false, requestToken: result, isError: false);
          print(23);
        }
      } catch (e) {
        final res = (e as DioError).response!.data['success'];

        if (!res) {
          yield state.copyWith(isError: true, isLoading: false);
        }
      }
    }
  }
}
