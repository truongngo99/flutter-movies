import 'package:equatable/equatable.dart';
import 'package:flutter_movies/models/authentication/login_body.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonEvent extends LoginEvent {
  final LoginBody loginBody;

  const LoginButtonEvent({required this.loginBody});
  @override
  List<Object> get props => [loginBody];

  @override
  String toString() => 'LoginButton {requestLogin: $loginBody}';
}
