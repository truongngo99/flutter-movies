import 'package:dio/dio.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/caster/caster_event.dart';
import 'package:flutter_movies/view/caster/caster_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class CasterBloc extends BaseBloc<CasterState> {
  CasterBloc() : super(CasterStateLoading());

  @override
  Stream<CasterState> mapEventToState(BaseEvent event) async* {
    if (event is CasterClickEvent) {
      try {
        var result = await ApiClient(Dio()).getProfileCasterMovie(event.id);
        print('object');
        yield CasterStateSuccess(personCaster: result);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
