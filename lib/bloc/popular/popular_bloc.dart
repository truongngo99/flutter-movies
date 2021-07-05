import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/popular/popular_event.dart';
import 'package:flutter_movies/bloc/popular/popular_state.dart';
import 'package:flutter_movies/network/api.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc() : super(PopularLoading());

  @override
  Stream<PopularState> mapEventToState(PopularEvent event) async* {
    if (event is PopularEventStart) {
      var result = await ApiClient(Dio()).getListMovieFopular();

      yield PopularSuccess(result);
    }
  }
}
