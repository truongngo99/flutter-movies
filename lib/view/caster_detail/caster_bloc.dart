import 'package:dio/dio.dart';
import 'package:flutter_movies/data/post/api.dart';

import 'package:flutter_movies/view/caster_detail/caster_event.dart';
import 'package:flutter_movies/view/caster_detail/caster_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class CasterBloc extends BaseBloc<CasterStateSuccess> {
  Api api;
  CasterBloc(this.api) : super(CasterStateSuccess());

  @override
  Stream<CasterStateSuccess> mapEventToState(BaseEvent event) async* {
    if (event is CasterClickEvent) {
      yield state.copyWith(isLoading: true);
      try {
        var result = await api.getProfileCasterMovie(event.id);
        print(result.profile_path);
        yield state.copyWith(personCaster: result, isLoading: false);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
