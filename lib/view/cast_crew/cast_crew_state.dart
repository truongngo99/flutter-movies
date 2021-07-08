import 'package:flutter_movies/data/response/cast_crew/cast_crew.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

abstract class CastCrewState extends BaseState {}

class CastCrewStateLoading extends CastCrewState {}

class CastCrewStateSuccess extends CastCrewState {
  final CastCrew? castCrew;
  CastCrewStateSuccess({this.castCrew});
  @override
  List<Object> get props => [castCrew ?? ''];
  @override
  String toString() => 'CastCrew: $castCrew';
}
