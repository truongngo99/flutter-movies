import 'package:equatable/equatable.dart';
import 'package:flutter_movies/models/image/image_model.dart';
import 'package:flutter_movies/models/review_movie/review_movie_model.dart';

abstract class ReviewMovieState extends Equatable {
  ReviewMovieState();
  @override
  List<Object> get props => [];
}

class ReviewMovieStateLoading extends ReviewMovieState {}

class ReviewMovieStateSucess extends ReviewMovieState {
  final ReviewMovieModel? reviewMovieModel;
  ReviewMovieStateSucess({this.reviewMovieModel});
  @override
  List<Object> get props => [reviewMovieModel ?? ''];

  @override
  String toString() {
    // TODO: implement toString
    return 'ImageModel: $reviewMovieModel';
  }
}
