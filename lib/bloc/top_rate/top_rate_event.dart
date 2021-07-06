import 'package:equatable/equatable.dart';

abstract class MovieTopRateEvent extends Equatable {
  const MovieTopRateEvent();
}

class MovieTopRateEventStart extends MovieTopRateEvent {
  const MovieTopRateEventStart();

  @override
  List<Object> get props => [];
}
