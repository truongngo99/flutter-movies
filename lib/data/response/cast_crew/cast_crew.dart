import 'package:flutter_movies/data/response/cast_crew/cast.dart';
import 'package:flutter_movies/data/response/cast_crew/crew.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cast_crew.g.dart';

@JsonSerializable()
class CastCrew {
  int? id;
  List<Cast>? cast;
  List<Crew>? crew;

  CastCrew({required this.cast, required this.crew, this.id});
  factory CastCrew.fromJson(Map<String, dynamic> json) =>
      _$CastCrewFromJson(json);
  Map<String, dynamic> toJson() => _$CastCrewToJson(this);
}
