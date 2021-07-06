import 'package:flutter_movies/models/movie_trending/movie_list_result.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_trending_model.g.dart';

@JsonSerializable()
class MovieTrendingModel {
  int page;
  int total_pages;
  int total_results;
  List<MovideListResult> results;
  MovieTrendingModel(
      {required this.results,
      required this.page,
      required this.total_pages,
      required this.total_results});
  factory MovieTrendingModel.fromJson(Map<String, dynamic> json) =>
      _$MovieTrendingModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieTrendingModelToJson(this);
}
