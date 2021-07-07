import 'package:equatable/equatable.dart';

abstract class GetPosterEvent extends Equatable {
  const GetPosterEvent();
}

class GetPosterEventStart extends GetPosterEvent {
  final String movieId;
  const GetPosterEventStart({required this.movieId});

  @override
  List<Object> get props => [];
}
