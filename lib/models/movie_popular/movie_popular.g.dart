// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviePopular _$MoviePopularFromJson(Map<String, dynamic> json) {
  return MoviePopular(
    page: json['page'] as int,
    results: (json['results'] as List<dynamic>)
        .map((e) => ListMoviePopular.fromJson(e as Map<String, dynamic>))
        .toList(),
    total_pages: json['total_pages'] as int,
    total_results: json['total_results'] as int,
  );
}

Map<String, dynamic> _$MoviePopularToJson(MoviePopular instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
