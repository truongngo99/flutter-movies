import 'package:flutter_movies/models/movie_popular/list_movie.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_popular.g.dart';

@JsonSerializable()
class MoviePopular {
  int page;
  List<ListMoviePopular> results;
  int total_pages;
  int total_results;

  MoviePopular(
      {required this.page,
      required this.results,
      required this.total_pages,
      required this.total_results});

  factory MoviePopular.fromJson(Map<String, dynamic> json) =>
      _$MoviePopularFromJson(json);
  Map<String, dynamic> toJson() => _$MoviePopularToJson(this);
}
