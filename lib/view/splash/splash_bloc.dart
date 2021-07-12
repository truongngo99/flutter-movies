import 'package:flutter_movies/data/post/api.dart';

import 'package:flutter_movies/utils/preference_util.dart';
import 'package:flutter_movies/view/splash/splash_event.dart';
import 'package:flutter_movies/view/splash/splash_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SplashBoc extends BaseBloc<SplashStateSuccess> {
  Api api;
  SplashBoc(this.api) : super(SplashStateSuccess());

  @override
  Stream<SplashStateSuccess> mapEventToState(BaseEvent event) async* {
    if (event is SplashEvent) {
      yield state.copyWith(isLoading: true);
      try {
        var result = await api.getRequestToken();
        if (result.success) {
          PreferenceUtils.setString('requestToken', result.request_token);
        }

        yield state.copyWith(isLoading: false, requestToken: result);
      } catch (e) {
        yield state.copyWith(isLoading: true, requestToken: null);
        print(e.toString());
      }
    }
  }
}
