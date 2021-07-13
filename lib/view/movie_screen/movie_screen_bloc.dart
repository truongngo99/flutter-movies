import 'package:dio/dio.dart';
import 'package:flutter_movies/data/post/api.dart';

import 'package:flutter_movies/view/movie_screen/movie_screen_event.dart';
import 'package:flutter_movies/view/movie_screen/movie_screen_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class MovieScreenBloc extends BaseBloc<MovieScreenState> {
  Api api;
  MovieScreenBloc(this.api) : super(MovieScreenState());

  @override
  Stream<MovieScreenState> mapEventToState(BaseEvent event) async* {
    if (event is MovieScreenEvent) {
      yield state.copyWith(isLoading: true);
      try {
        var movieTopTrending = await api.getListMovieTrending();
        var moviePopular = await api.getListMovieFopular();
        var movieNowPlaying = await api.getListMoviePlaying();
        var movieTopRate = await api.getListMovieTopRate();

        var movieUpcoming = await api.getListMovieUpcoming();
        yield state.copyWith(
            isLoading: false, movieModelTrending: movieTopTrending);
        yield state.copyWith(isLoading: false, movieModelPopular: moviePopular);
        yield state.copyWith(
            isLoading: false, movieModelNowPlaying: movieNowPlaying);
        yield state.copyWith(isLoading: false, movieModelTopRate: movieTopRate);
        yield state.copyWith(
            isLoading: false, movieModelUpComming: movieUpcoming);
      } catch (e) {
        state.copyWith(isLoading: true);
      }
    }
  }
}
