import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/review_movie/reivew_movie_state.dart';
import 'package:flutter_movies/bloc/review_movie/review_movie.evetn.dart';
import 'package:flutter_movies/network/api.dart';

class ReviewMovieBloc extends Bloc<ReviewMovieEvent, ReviewMovieState> {
  ReviewMovieBloc() : super(ReviewMovieStateLoading());

  @override
  Stream<ReviewMovieState> mapEventToState(ReviewMovieEvent event) async* {
    if (event is ReviewMovieEventStart) {
      try {
        var result = await ApiClient(Dio()).getReviewMovie(event.movieId);
        print('lay duoc review movie: $result');
        yield ReviewMovieStateSucess(reviewMovieModel: result);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
