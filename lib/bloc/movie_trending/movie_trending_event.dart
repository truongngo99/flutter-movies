import 'package:equatable/equatable.dart';

abstract class MovieTrendingEvent extends Equatable {
  const MovieTrendingEvent();
}

class MovieTrendingEventStart extends MovieTrendingEvent {
  const MovieTrendingEventStart();

  @override
  List<Object?> get props => [];
}
