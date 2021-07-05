import 'package:equatable/equatable.dart';
import 'package:flutter_movies/models/movie_now_playing/movie_now_playing.dart';
import 'package:flutter_movies/models/movie_popular/movie_popular.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();
  @override
  List<Object> get props => [];
}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingSuccess extends NowPlayingState {
  final MovieNowPlaying movieNowPlaying;

  NowPlayingSuccess(this.movieNowPlaying);
  @override
  List<Object> get props => [movieNowPlaying];
  @override
  String toString() => 'MoviePopular: $movieNowPlaying';
}
