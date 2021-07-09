import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/get_poster/get_poster_event.dart';
import 'package:flutter_movies/bloc/get_poster/get_poster_state.dart';
import 'package:flutter_movies/network/api.dart';

class GetPosterBloc extends Bloc<GetPosterEvent, GetPosterState> {
  GetPosterBloc() : super(GetPosterStateLoading());

  @override
  Stream<GetPosterState> mapEventToState(GetPosterEvent event) async* {
    if (event is GetPosterEventStart) {
      try {
        var result = await ApiClient(Dio()).getPosterMovie(event.movieId);
        print('lay dk poster: ${result.posters!.length}');
        yield GetPosterStateSucess(imageModel: result);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
