import 'package:flutter_movies/data/response/authentication/request_token.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SplashStateSuccess extends BaseState {
  final bool isLoading;
  final RequestToken? requestToken;
  SplashStateSuccess({this.isLoading = true, this.requestToken});

  @override
  List<Object> get props => [isLoading, requestToken ?? ''];

  SplashStateSuccess copyWith({RequestToken? requestToken, bool? isLoading}) =>
      SplashStateSuccess(
          requestToken: requestToken ?? this.requestToken,
          isLoading: isLoading ?? this.isLoading);
}
