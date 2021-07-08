import 'package:teq_flutter_core/teq_flutter_core.dart';

abstract class TrailerEvent extends BaseEvent {}

class TrailerEventStart extends TrailerEvent {
  final String movieId;
  TrailerEventStart({required this.movieId});

  List<Object> get props => [];
}
