import 'package:flutter_movies/data/post/api.dart';
import 'package:flutter_movies/view/search/search_event.dart';
import 'package:flutter_movies/view/search/search_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SearchBloc extends BaseBloc<SearchState> {
  Api api;
  SearchBloc(this.api) : super(SearchState());

  @override
  Stream<SearchState> mapEventToState(BaseEvent event) async* {
    if (event is SearchEvent) {
      yield state.copyWith(isLoading: true);
      // var resultMovie = await api.getMovieSearch(event.search);
      // var resultKey = await api.getSearchKey(event.search);
      var result = await api.getSearchKey(event.search);

      yield state.copyWith(isLoading: false, searchKeyModel: result);
    }
  }
}
