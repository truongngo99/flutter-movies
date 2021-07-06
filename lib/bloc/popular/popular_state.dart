import 'package:equatable/equatable.dart';
import 'package:flutter_movies/models/movie_popular/movie_popular.dart';

abstract class PopularState extends Equatable {
  const PopularState();
  @override
  List<Object> get props => [];
}

class PopularLoading extends PopularState {}

class PopularSuccess extends PopularState {
  final MoviePopular moviePopular;

  PopularSuccess(this.moviePopular);
  @override
  List<Object> get props => [moviePopular];
  @override
  String toString() => 'MoviePopular: $moviePopular';
}

class PopularFailed extends PopularState {}
