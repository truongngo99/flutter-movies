import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/top_rate/top_rate_event.dart';
import 'package:flutter_movies/bloc/top_rate/top_rate_state.dart';
import 'package:flutter_movies/network/api.dart';

class MovieTopRateBloc extends Bloc<MovieTopRateEvent, MovieTopRateState> {
  MovieTopRateBloc() : super(MovieTopRateLoading());

  @override
  Stream<MovieTopRateState> mapEventToState(MovieTopRateEvent event) async* {
    if (event is MovieTopRateEventStart) {
      try {
        var result = await ApiClient(Dio()).getListMovieTopRate();
        print('Movie Top Rate: ${result.results.length}');
        yield MovieTopRateSuccess(result);
      } catch (e) {
        print(e.toString());
        yield MovieTopRateFailed();
      }
    }
  }
}
