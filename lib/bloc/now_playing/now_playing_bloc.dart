import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_event.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_state.dart';
import 'package:flutter_movies/bloc/popular/popular_event.dart';
import 'package:flutter_movies/bloc/popular/popular_state.dart';
import 'package:flutter_movies/network/api.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(NowPlayingLoading());

  @override
  Stream<NowPlayingState> mapEventToState(NowPlayingEvent event) async* {
    if (event is NowPlayingEventStart) {
      try {
        var result = await ApiClient(Dio()).getListMoviePlaying();

        yield NowPlayingSuccess(result);
      } catch (e) {
        print(e.toString());
        yield NowPlayingFailed();
      }
    }
  }
}
