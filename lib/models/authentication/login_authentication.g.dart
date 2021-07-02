// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestLogin _$RequestLoginFromJson(Map<String, dynamic> json) {
  return RequestLogin(
    username: json['username'] as String,
    password: json['password'] as String,
    request_token: json['request_token'] as String,
  );
}

Map<String, dynamic> _$RequestLoginToJson(RequestLogin instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'request_token': instance.request_token,
    };
