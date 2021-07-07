import 'package:equatable/equatable.dart';

abstract class ReviewMovieEvent extends Equatable {
  const ReviewMovieEvent();
}

class ReviewMovieEventStart extends ReviewMovieEvent {
  final String movieId;
  const ReviewMovieEventStart({required this.movieId});

  @override
  List<Object> get props => [];
}
