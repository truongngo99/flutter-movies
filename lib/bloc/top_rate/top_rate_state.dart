import 'package:equatable/equatable.dart';

import 'package:flutter_movies/models/movie_trending/movie_trending_model.dart';

abstract class MovieTopRateState extends Equatable {
  const MovieTopRateState();
  @override
  List<Object> get props => [];
}

class MovieTopRateLoading extends MovieTopRateState {}

class MovieTopRateSuccess extends MovieTopRateState {
  final MovieTrendingModel movieTopRate;

  MovieTopRateSuccess(this.movieTopRate);

  @override
  List<Object> get props => [movieTopRate];
  @override
  String toString() => 'MovieTopRate: $movieTopRate';
}

class MovieTopRateFailed extends MovieTopRateState {}
