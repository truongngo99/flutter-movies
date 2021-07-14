import 'package:flutter_movies/data/response/model/model.dart';
import 'package:flutter_movies/data/response/model/save_model.dart';
import 'package:flutter_movies/data/response/movie/movie_model.dart';
import 'package:flutter_movies/data/response/search_key/search_key_model.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SearchState extends BaseState {
  final bool isLoading;
  final MovieModel? movieModel;
  final SearchKeyModel? searchKeyModel;
  final SaveModel? saveModel;
  SearchState(
      {this.isLoading = false,
      this.movieModel,
      this.searchKeyModel,
      this.saveModel});

  @override
  List<Object> get props =>
      [isLoading, movieModel ?? '', searchKeyModel ?? '', saveModel ?? ''];

  @override
  String toString() =>
      'Search State: $isLoading, $movieModel, $searchKeyModel, $saveModel';

  SearchState copyWith({
    bool? isLoading,
    MovieModel? movieModel,
    SearchKeyModel? searchKeyModel,
    SaveModel? saveModel,
  }) =>
      SearchState(
        isLoading: isLoading ?? this.isLoading,
        movieModel: movieModel ?? this.movieModel,
        searchKeyModel: searchKeyModel ?? this.searchKeyModel,
        saveModel: saveModel ?? this.saveModel,
      );
}
