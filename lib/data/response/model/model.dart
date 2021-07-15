import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class ModelA {
  int? page;
  int? total_results;
  int? total_pages;
  List<Map<String, dynamic>>? results;
  ModelA();
  factory ModelA.fromJson(Map<String, dynamic> json) => _$ModelAFromJson(json);
  Map<String, dynamic> toJson() => _$ModelAToJson(this);
}
