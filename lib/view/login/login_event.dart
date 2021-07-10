import 'package:flutter_movies/data/response/authentication/login_body.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class LoginButtonEvent extends BaseEvent {
  final LoginBody loginBody;

  LoginButtonEvent({required this.loginBody});

  List<Object> get props => [loginBody];

  @override
  String toString() => 'LoginButton {requestLogin: $loginBody}';
}
