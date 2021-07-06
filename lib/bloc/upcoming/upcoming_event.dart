import 'package:equatable/equatable.dart';

abstract class MovieUpcomingEvent extends Equatable {
  const MovieUpcomingEvent();
}

class MovieUpcomingEventStart extends MovieUpcomingEvent {
  const MovieUpcomingEventStart();

  @override
  List<Object> get props => [];
}
