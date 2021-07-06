import 'package:flutter_movies/models/movie_now_playing/list_movie_nowplaying.dart';
import 'package:flutter_movies/models/movie_popular/list_movie.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_now_playing.g.dart';

@JsonSerializable()
class MovieNowPlayingModel {
  int page;
  List<ListMovieNowPlayingModel> results;
  Map<String, dynamic> dates;
  int total_pages;
  int total_results;

  MovieNowPlayingModel(
      {required this.page,
      required this.results,
      required this.dates,
      required this.total_pages,
      required this.total_results});

  factory MovieNowPlayingModel.fromJson(Map<String, dynamic> json) =>
      _$MovieNowPlayingModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieNowPlayingModelToJson(this);
}
