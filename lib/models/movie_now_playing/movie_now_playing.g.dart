// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_now_playing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieNowPlaying _$MovieNowPlayingFromJson(Map<String, dynamic> json) {
  return MovieNowPlaying(
    page: json['page'] as int,
    results: (json['results'] as List<dynamic>)
        .map((e) => ListMoviePopular.fromJson(e as Map<String, dynamic>))
        .toList(),
    dates: json['dates'] as Map<String, dynamic>,
    total_pages: json['total_pages'] as int,
    total_results: json['total_results'] as int,
  );
}

Map<String, dynamic> _$MovieNowPlayingToJson(MovieNowPlaying instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'dates': instance.dates,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
