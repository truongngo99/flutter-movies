import 'package:flutter_movies/data/response/search_key/search_key_model.dart';
import 'package:flutter_movies/data/response/search_multi/search_multi.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SearchState extends BaseState {
  final bool isLoading;
  final SearchKeyModel? searchKeyModel;
  final SearchMultiModel? searchMultiModelSecond;

  SearchState({
    this.isLoading = false,
    this.searchKeyModel,
    this.searchMultiModelSecond,
  });

  @override
  List<Object> get props =>
      [isLoading, searchMultiModelSecond ?? '', searchKeyModel ?? ''];

  @override
  String toString() =>
      'Search State: $isLoading, $searchMultiModelSecond, $searchKeyModel';

  SearchState copyWith({
    bool? isLoading,
    SearchKeyModel? searchKeyModel,
    SearchMultiModel? searchMultiModelSecond,
  }) =>
      SearchState(
        isLoading: isLoading ?? this.isLoading,
        searchMultiModelSecond:
            searchMultiModelSecond ?? this.searchMultiModelSecond,
        searchKeyModel: searchKeyModel ?? this.searchKeyModel,
      );
}
