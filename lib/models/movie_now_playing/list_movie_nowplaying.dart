import 'package:json_annotation/json_annotation.dart';
part 'list_movie_nowplaying.g.dart';

@JsonSerializable()
class ListMovieNowPlayingModel {
  String? poster_path;
  bool adult;
  String overview;
  String release_date;
  late List<int>? genre_ids;
  int id;
  String original_title;
  String original_language;
  String title;
  String? backdrop_path;
  double popularity;
  int vote_count;
  bool video;
  double vote_average;

  ListMovieNowPlayingModel({
    this.poster_path,
    required this.adult,
    required this.overview,
    required this.release_date,
    required this.genre_ids,
    required this.id,
    required this.original_title,
    required this.original_language,
    required this.title,
    this.backdrop_path,
    required this.popularity,
    required this.vote_count,
    required this.video,
    required this.vote_average,
  });

  factory ListMovieNowPlayingModel.fromJson(Map<String, dynamic> json) =>
      _$ListMovieNowPlayingModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListMovieNowPlayingModelToJson(this);
}
