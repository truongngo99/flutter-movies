import 'package:dio/dio.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/cast_crew/cast_crew_event.dart';
import 'package:flutter_movies/view/cast_crew/cast_crew_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class CastCewBloc extends BaseBloc<CastCrewState> {
  CastCewBloc() : super(CastCrewStateLoading());

  @override
  Stream<CastCrewState> mapEventToState(BaseEvent event) async* {
    if (event is CastCrewEventStart) {
      try {
        var result = await ApiClient(Dio()).getCastCrewMovie(event.movieId);
        print('Lay duoc cast and crew movie $result');
        yield CastCrewStateSuccess(castCrew: result);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
