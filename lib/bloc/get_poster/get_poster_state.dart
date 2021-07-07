import 'package:equatable/equatable.dart';
import 'package:flutter_movies/models/image/image_model.dart';

abstract class GetPosterState extends Equatable {
  GetPosterState();
  @override
  List<Object> get props => [];
}

class GetPosterStateLoading extends GetPosterState {}

class GetPosterStateSucess extends GetPosterState {
  final ImageModel? imageModel;
  GetPosterStateSucess({this.imageModel});
  @override
  List<Object> get props => [imageModel ?? ''];

  @override
  String toString() {
    // TODO: implement toString
    return 'ImageModel: $imageModel';
  }
}
