import 'package:flutter_movies/data/post/api.dart';

import 'package:flutter_movies/view/movie_detail/movie_detail_event.dart';
import 'package:flutter_movies/view/movie_detail/movie_detail_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class MovieDetailBloc extends BaseBloc<MovieDetailState> {
  Api api;
  MovieDetailBloc(this.api) : super(MovieDetailState());

  @override
  Stream<MovieDetailState> mapEventToState(BaseEvent event) async* {
    if (event is MovieDetailClickEvent) {
      yield state.copyWith(isLoading: true);
      var castcrew = await api.getCastCrewMovie(event.id);
      var trailer = await api.getTrailerMovie(event.id);
      print(trailer.results?.length);
      yield state.copyWith(
          isLoading: false, castCrewModel: castcrew, trailerModel: trailer);
    }
  }
}
