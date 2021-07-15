import 'package:flutter_movies/data/post/api.dart';
import 'package:flutter_movies/view/detail_search/detail_search_event.dart';
import 'package:flutter_movies/view/detail_search/detail_search_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SearchBlocFilter extends BaseBloc<SearchStateFilter> {
  Api api;
  SearchBlocFilter(this.api) : super(SearchStateFilter());

  @override
  Stream<SearchStateFilter> mapEventToState(BaseEvent event) async* {
    if (event is SearchEventFilter) {
      yield state.copyWith(isLoading: true);
      var result = await api.getSearchMul(event.search);
      yield state.copyWith(isLoading: false, searchMultiModel: result);
    }
  }
}
