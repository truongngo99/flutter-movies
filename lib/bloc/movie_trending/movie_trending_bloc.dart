import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/movie_trending/movie_trending_event.dart';
import 'package:flutter_movies/bloc/movie_trending/movie_trending_state.dart';
import 'package:flutter_movies/network/api.dart';

class MovieTrendingBloc extends Bloc<MovieTrendingEvent, MovieTrendingState> {
  MovieTrendingBloc() : super(MovieTrendingLoading());

  @override
  Stream<MovieTrendingState> mapEventToState(MovieTrendingEvent event) async* {
    if (event is MovieTrendingEventStart) {
      try {
        var result = await ApiClient(Dio()).getListMovieTrending();
        print('resul movie traing ${result.results.length}');
        yield MovieTrendingSuccess(movieTreding: result);
      } catch (e) {
        print(e.toString());
        yield MovieTrendingFailed();
      }
    }
  }
}
