import 'package:dio/dio.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/trailer/trailer_event.dart';
import 'package:flutter_movies/view/trailer/trailer_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class TrailerBloc extends BaseBloc<TrailerState> {
  TrailerBloc() : super(TrailerStateLoading());

  @override
  Stream<TrailerState> mapEventToState(BaseEvent event) async* {
    if (event is TrailerEventStart) {
      try {
        var resutl = await ApiClient(Dio()).getTrailerMovie(event.movieId);
        print('Trailer: $resutl');
        yield TrailerStateSuccess(trailer: resutl);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
