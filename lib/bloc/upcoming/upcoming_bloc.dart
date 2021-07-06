import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_movies/bloc/upcoming/upcoming_event.dart';
import 'package:flutter_movies/bloc/upcoming/upcoming_state.dart';
import 'package:flutter_movies/network/api.dart';

class MovieUpcomingBloc extends Bloc<MovieUpcomingEvent, MovieUpcomingState> {
  MovieUpcomingBloc() : super(MovieUpcomingStateLoading());

  @override
  Stream<MovieUpcomingState> mapEventToState(MovieUpcomingEvent event) async* {
    if (event is MovieUpcomingEventStart) {
      try {
        var result = await ApiClient(Dio()).getListMovieUpcoming();
        print('movie upcoming: ${result.total_pages}');
        yield MovieUpcomingStateSuccess(result);
      } catch (e) {
        print(e.toString());
        yield MovieUpcomingStateFailed();
      }
    }
  }
}
