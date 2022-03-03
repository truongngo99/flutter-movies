import 'package:flutter_movies/data/response/authentication/request_token.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

// abstract class LoginState extends BaseState {
//   LoginState();

//   @override
//   List<Object> get props => [];
// }

// class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends BaseState {
  final RequestToken? requestToken;
  final bool isLoading;
  final bool isError;

  LoginStateSuccess(
      {this.isLoading = false, this.requestToken, this.isError = false});
  @override
  List<Object> get props => [requestToken ?? '', isLoading, isError];
  @override
  String toString() => 'RequestToken: $requestToken  $isLoading';
  LoginStateSuccess copyWith(
          {RequestToken? requestToken, bool? isLoading, bool? isError}) =>
      LoginStateSuccess(
          requestToken: requestToken ?? this.requestToken,
          isError: isError ?? this.isError,
          isLoading: isLoading ?? this.isLoading);
}

// class LoginStateFailed extends LoginState {}
