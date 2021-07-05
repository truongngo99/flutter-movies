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
    if (event is PopularEventStart) {
      var result = await ApiClient(Dio()).getListMoviePlaying();
      print(result.total_pages);
      yield NowPlayingSuccess(result);
    }
  }
}
