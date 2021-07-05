import 'package:json_annotation/json_annotation.dart';

part 'list_movie.g.dart';

@JsonSerializable()
class ListMoviePopular {
  bool adult;
  String? backdrop_path;
  List<int> genre_ids;
  int id;
  String original_language;
  String original_title;
  String overview;
  double popularity;
  String? poster_path;
  String release_date;
  String title;
  bool video;
  double vote_average;
  int vote_count;

  ListMoviePopular(
      {required this.adult,
      required this.backdrop_path,
      required this.genre_ids,
      required this.id,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.release_date,
      required this.title,
      required this.video,
      required this.vote_average,
      required this.vote_count});
  factory ListMoviePopular.fromJson(Map<String, dynamic> json) =>
      _$ListMoviePopularFromJson(json);
  Map<String, dynamic> toJson() => _$ListMoviePopularToJson(this);
}
