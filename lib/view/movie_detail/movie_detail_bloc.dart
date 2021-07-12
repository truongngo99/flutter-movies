import 'package:dio/dio.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/movie_detail/movie_detail_event.dart';
import 'package:flutter_movies/view/movie_detail/movie_detail_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class MovieDetailBloc extends BaseBloc<MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailState());

  @override
  Stream<MovieDetailState> mapEventToState(BaseEvent event) async* {
    if (event is MovieDetailClickEvent) {
      yield state.copyWith(isLoading: true);
      var castcrew = await ApiClient(Dio()).getCastCrewMovie(event.id);
      var trailer = await ApiClient(Dio()).getTrailerMovie(event.id);
      yield state.copyWith(
          isLoading: false, castCrewModel: castcrew, trailerModel: trailer);
    }
  }
}
