import 'package:equatable/equatable.dart';

abstract class NowPlayingEvent extends Equatable {
  const NowPlayingEvent();
}

class NowPlayingEventStart extends NowPlayingEvent {
  const NowPlayingEventStart();
  @override
  List<Object> get props => [];
}
