import 'package:equatable/equatable.dart';

import 'package:flutter_movies/models/movie_now_playing/movie_now_playing.dart';

abstract class MovieUpcomingState extends Equatable {
  const MovieUpcomingState();
  @override
  List<Object> get props => [];
}

class MovieUpcomingStateLoading extends MovieUpcomingState {}

class MovieUpcomingStateSuccess extends MovieUpcomingState {
  final MovieNowPlayingModel movieUpcoming;

  MovieUpcomingStateSuccess(this.movieUpcoming);

  @override
  List<Object> get props => [movieUpcoming];
  @override
  String toString() => 'MovieUpcoming: $movieUpcoming';
}

class MovieUpcomingStateFailed extends MovieUpcomingState {}
