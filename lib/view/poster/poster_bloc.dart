import 'package:dio/dio.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/poster/poster_event.dart';
import 'package:flutter_movies/view/poster/poster_sate.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class GetPosterBloc extends BaseBloc<GetPosterStateSucess> {
  GetPosterBloc() : super(GetPosterStateSucess());

  @override
  Stream<GetPosterStateSucess> mapEventToState(BaseEvent event) async* {
    if (event is GetPosterEventStart) {
      yield state.copyWith(isLoading: true);
      try {
        var result = await ApiClient(Dio()).getPosterMovie(event.movieId);
        yield state.copyWith(imageModel: result, isLoading: false);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}