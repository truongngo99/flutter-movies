import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_movies/models/authentication/request_token.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  // final String error;

  // const LoginFailed({required this.error});

  // @override
  // List<Object> get props => [error];

  // @override
  // String toString() => 'Error: {$error}';
}
