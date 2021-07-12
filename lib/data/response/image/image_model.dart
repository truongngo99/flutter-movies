import 'package:flutter_movies/data/response/image/backdrop_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  int? id;
  List<BackdropModel>? backdrops;
  List<BackdropModel>? posters;

  ImageModel();
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
