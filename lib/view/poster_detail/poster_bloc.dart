import 'package:dio/dio.dart';
import 'package:flutter_movies/data/post/api.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/poster_detail/poster_event.dart';
import 'package:flutter_movies/view/poster_detail/poster_sate.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class GetPosterBloc extends BaseBloc<GetPosterStateSucess> {
  Api api;
  GetPosterBloc(this.api) : super(GetPosterStateSucess());

  @override
  Stream<GetPosterStateSucess> mapEventToState(BaseEvent event) async* {
    if (event is GetPosterEventStart) {
      yield state.copyWith(isLoading: true);
      try {
        var result = await api.getPosterMovie(event.movieId);
        print(result.backdrops!.length);
        yield state.copyWith(imageModel: result, isLoading: false);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
