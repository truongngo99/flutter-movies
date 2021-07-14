// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelA _$ModelAFromJson(Map<String, dynamic> json) {
  return ModelA()
    ..page = json['page'] as int?
    ..total_results = json['total_results'] as int?
    ..total_pages = json['total_pages'] as int?
    ..results = (json['results'] as List<dynamic>?)
        ?.map((e) => e as Map<String, dynamic>)
        .toList();
}

Map<String, dynamic> _$ModelAToJson(ModelA instance) => <String, dynamic>{
      'page': instance.page,
      'total_results': instance.total_results,
      'total_pages': instance.total_pages,
      'results': instance.results,
    };
