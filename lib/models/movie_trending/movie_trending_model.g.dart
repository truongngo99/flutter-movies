// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_trending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieTrendingModel _$MovieTrendingModelFromJson(Map<String, dynamic> json) {
  return MovieTrendingModel(
    results: (json['results'] as List<dynamic>)
        .map((e) => MovideListResult.fromJson(e as Map<String, dynamic>))
        .toList(),
    page: json['page'] as int,
    total_pages: json['total_pages'] as int,
    total_results: json['total_results'] as int,
  );
}

Map<String, dynamic> _$MovieTrendingModelToJson(MovieTrendingModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
      'results': instance.results,
    };
