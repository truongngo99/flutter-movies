import 'package:flutter_movies/data/response/movie/movie_model.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class MovieScreenState extends BaseState {
  final bool isLoading;
  final MovieModel? movieModelTrending;
  final MovieModel? movieModelPopular;
  final MovieModel? movieModelNowPlaying;
  final MovieModel? movieModelTopRate;
  final MovieModel? movieModelUpComming;

  MovieScreenState(
      {this.movieModelTrending,
      this.movieModelPopular,
      this.movieModelNowPlaying,
      this.movieModelTopRate,
      this.movieModelUpComming,
      this.isLoading = false});
  @override
  List<Object> get props => [
        movieModelPopular ?? '',
        movieModelNowPlaying ?? '',
        movieModelTrending ?? '',
        movieModelUpComming ?? '',
        movieModelTopRate ?? '',
        isLoading,
      ];
  @override
  String toString() =>
      'MovieScreenState: $isLoading $movieModelNowPlaying $movieModelPopular, $movieModelTopRate, $movieModelTrending, $movieModelUpComming';
  MovieScreenState copyWith({
    bool? isLoading,
    final MovieModel? movieModelTrending,
    final MovieModel? movieModelPopular,
    final MovieModel? movieModelNowPlaying,
    final MovieModel? movieModelTopRate,
    final MovieModel? movieModelUpComming,
  }) =>
      MovieScreenState(
        isLoading: isLoading ?? this.isLoading,
        movieModelPopular: movieModelPopular ?? this.movieModelPopular,
        movieModelNowPlaying: movieModelNowPlaying ?? this.movieModelNowPlaying,
        movieModelTopRate: movieModelTopRate ?? this.movieModelTopRate,
        movieModelTrending: movieModelTrending ?? this.movieModelTrending,
        movieModelUpComming: movieModelUpComming ?? this.movieModelUpComming,
      );
}
