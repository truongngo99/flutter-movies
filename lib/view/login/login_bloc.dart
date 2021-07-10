import 'package:dio/dio.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/utils/preference_util.dart';
import 'package:flutter_movies/view/login/login_event.dart';
import 'package:flutter_movies/view/login/login_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class LoginBloc extends BaseBloc<LoginState> {
  LoginBloc() : super(LoginStateLoading());

  @override
  Stream<LoginState> mapEventToState(BaseEvent event) async* {
    if (event is LoginButtonEvent) {
      yield LoginStateLoading();
      try {
        var result = await ApiClient(Dio()).login(event.loginBody);
        print('18');
        if (result.success) {
          var session = await ApiClient(Dio())
              .createSession(PreferenceUtils.getString('requestToken'));
          PreferenceUtils.setString('session_id', session.session_id);
          yield LoginStateSuccess(requestToken: result, isLoading: true);
          print(23);
        }
      } catch (e) {
        final res = (e as DioError).response!.data['success'];

        if (!res) {
          yield LoginStateFailed();
        }
      }
    }
  }
}
