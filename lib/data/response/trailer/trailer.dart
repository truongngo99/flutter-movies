import 'package:flutter_movies/data/response/trailer/list_trailer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'trailer.g.dart';

@JsonSerializable()
class Trailer {
  int id;
  List<ResultTrailers>? results;
  Trailer(this.id, this.results);
  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);
  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}
