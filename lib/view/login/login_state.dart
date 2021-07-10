import 'package:flutter_movies/data/response/authentication/request_token.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

abstract class LoginState extends BaseState {
  LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final RequestToken? requestToken;
  final bool? isLoading;

  LoginStateSuccess({
    this.isLoading = true,
    this.requestToken,
  });
  @override
  List<Object> get props => [requestToken ?? ''];
  @override
  String toString() => 'RequestToken: $requestToken  $isLoading';
  LoginStateSuccess copyWith({RequestToken? requestToken, bool? isLoading}) =>
      LoginStateSuccess(
          requestToken: requestToken ?? this.requestToken,
          isLoading: isLoading ?? this.isLoading);
}

class LoginStateFailed extends LoginState {}
