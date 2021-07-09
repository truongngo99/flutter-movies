import 'package:flutter_movies/models/image/image_model.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class GetPosterStateSucess extends BaseState {
  final bool isLoading;
  final ImageModel? imageModel;
  GetPosterStateSucess({this.isLoading = true, this.imageModel});
  @override
  List<Object> get props => [imageModel ?? ''];

  @override
  String toString() {
    // TODO: implement toString
    return 'ImageModel: $imageModel';
  }

  GetPosterStateSucess copyWith({ImageModel? imageModel, bool? isLoading}) =>
      GetPosterStateSucess(
          imageModel: imageModel ?? this.imageModel,
          isLoading: isLoading ?? this.isLoading);
}
