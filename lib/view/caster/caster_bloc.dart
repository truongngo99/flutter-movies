import 'package:dio/dio.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/caster/caster_event.dart';
import 'package:flutter_movies/view/caster/caster_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class CasterBloc extends BaseBloc<CasterStateSuccess> {
  CasterBloc() : super(CasterStateSuccess());

  @override
  Stream<CasterStateSuccess> mapEventToState(BaseEvent event) async* {
    if (event is CasterClickEvent) {
      yield state.copyWith(isLoading: true);
      try {
        var result = await ApiClient(Dio()).getProfileCasterMovie(event.id);
        print(result.profile_path);
        yield state.copyWith(personCaster: result, isLoading: false);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}