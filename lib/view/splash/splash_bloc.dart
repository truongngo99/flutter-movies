import 'package:dio/dio.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/utils/preference_util.dart';
import 'package:flutter_movies/view/splash/splash_event.dart';
import 'package:flutter_movies/view/splash/splash_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SplashBoc extends BaseBloc<SplashStateSuccess> {
  SplashBoc() : super(SplashStateSuccess());

  @override
  Stream<SplashStateSuccess> mapEventToState(BaseEvent event) async* {
    if (event is SplashEvent) {
      yield state.copyWith(isLoading: true);
      try {
        var result = await ApiClient(Dio()).getRequestToken();
        if (result.success) {
          PreferenceUtils.setString('requestToken', result.request_token);
        }
        //print(result.request_token);
        yield state.copyWith(isLoading: false, requestToken: result);
      } catch (e) {
        yield state.copyWith(isLoading: true, requestToken: null);
        print(e.toString());
      }
    }
  }
}
