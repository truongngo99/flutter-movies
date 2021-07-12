import 'package:flutter_movies/data/response/person_id/person_id.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

// abstract class CasterState extends BaseState {}

// class CasterStateLoading extends CasterState {}

// class CasterStateSuccess extends CasterState {
//   final PersonCaster? personCaster;
//   CasterStateSuccess({this.personCaster});
//   @override
//   List<Object> get props => [personCaster ?? ''];
//   @override
//   String toString() => 'PersonCaster: $personCaster';
// }

// class CasterStateFailed extends CasterState {}

class CasterStateSuccess extends BaseState {
  final bool isLoading;
  final PersonCaster? personCaster;
  CasterStateSuccess({this.isLoading = true, this.personCaster});
  @override
  List<Object> get props => [personCaster ?? ''];
  @override
  String toString() => 'PersonCaster: $personCaster';
  CasterStateSuccess copyWith({PersonCaster? personCaster, bool? isLoading}) =>
      CasterStateSuccess(
          personCaster: personCaster ?? this.personCaster,
          isLoading: isLoading ?? this.isLoading);
}
