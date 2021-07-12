import 'package:flutter_movies/data/response/cast_crew/cast_crew.dart';
import 'package:flutter_movies/data/response/trailer/trailer.dart';

import 'package:teq_flutter_core/teq_flutter_core.dart';

class MovieDetailState extends BaseState {
  final CastCrew? castCrewModel;
  final Trailer? trailerModel;
  final bool isLoading;
  MovieDetailState(
      {this.castCrewModel, this.trailerModel, this.isLoading = false});
  @override
  List<Object> get props => [
        isLoading,
        castCrewModel ?? '',
        trailerModel ?? '',
      ];
  @override
  String toString() => 'Moviedetail: $isLoading, $castCrewModel, $trailerModel';

  MovieDetailState copyWith(
          {CastCrew? castCrewModel, Trailer? trailerModel, bool? isLoading}) =>
      MovieDetailState(
          castCrewModel: castCrewModel ?? this.castCrewModel,
          trailerModel: trailerModel ?? this.trailerModel,
          isLoading: isLoading ?? this.isLoading);
}
