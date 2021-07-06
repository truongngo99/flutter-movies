import 'package:equatable/equatable.dart';
import 'package:flutter_movies/models/movie_popular/movie_popular.dart';
import 'package:flutter_movies/models/movie_trending/movie_trending_model.dart';

abstract class MovieTrendingState extends Equatable {
  MovieTrendingState();
  @override
  List<Object> get props => [];
}

class MovieTrendingLoading extends MovieTrendingState {}

class MovieTrendingSuccess extends MovieTrendingState {
  final MovieTrendingModel movieTreding;
  MovieTrendingSuccess({required this.movieTreding});
  @override
  List<Object> get props => [movieTreding];

  @override
  String toString() => 'MovieTreding: $movieTreding';
}

class MovieTrendingFailed extends MovieTrendingState {}
