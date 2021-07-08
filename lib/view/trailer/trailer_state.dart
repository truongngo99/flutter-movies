import 'package:flutter_movies/data/response/trailer/trailer.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

abstract class TrailerState extends BaseState {}

class TrailerStateLoading extends TrailerState {}

class TrailerStateSuccess extends TrailerState {
  final Trailer? trailer;
  TrailerStateSuccess({this.trailer});

  @override
  List<Object> get props => [trailer ?? ''];

  @override
  String toString() => 'Trailer: $trailer';
}
