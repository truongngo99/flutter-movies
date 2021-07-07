import 'package:flutter_movies/models/review_movie/result_review_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'review_movie_model.g.dart';

@JsonSerializable()
class ReviewMovieModel {
  int? id;
  int? page;
  List<ResultReview>? results;
  int? total_pages;
  int? total_results;

  ReviewMovieModel();
  factory ReviewMovieModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewMovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewMovieModelToJson(this);
}
