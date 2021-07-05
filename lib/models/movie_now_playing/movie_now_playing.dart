import 'package:flutter_movies/models/movie_popular/list_movie.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_now_playing.g.dart';

@JsonSerializable()
class MovieNowPlaying {
  int page;
  List<ListMoviePopular> results;
  Map<String, dynamic> dates;
  int total_pages;
  int total_results;

  MovieNowPlaying(
      {required this.page,
      required this.results,
      required this.dates,
      required this.total_pages,
      required this.total_results});

  factory MovieNowPlaying.fromJson(Map<String, dynamic> json) =>
      _$MovieNowPlayingFromJson(json);
  Map<String, dynamic> toJson() => _$MovieNowPlayingToJson(this);
}
