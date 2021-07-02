import 'package:json_annotation/json_annotation.dart';
part 'login_authentication.g.dart';

@JsonSerializable()
class RequestLogin {
  late String username;
  late String password;
  late String request_token;
  RequestLogin(
      {required this.username,
      required this.password,
      required this.request_token});
  factory RequestLogin.fromJson(Map<String, dynamic> json) =>
      _$RequestLoginFromJson(json);
  Map<String, dynamic> toJson() => _$RequestLoginToJson(this);
}
