import 'package:teq_flutter_core/teq_flutter_core.dart';

abstract class CastCrewEvent extends BaseEvent {}

class CastCrewEventStart extends CastCrewEvent {
  final String movieId;
  CastCrewEventStart({required this.movieId});

  List<Object> get props => [];
}
