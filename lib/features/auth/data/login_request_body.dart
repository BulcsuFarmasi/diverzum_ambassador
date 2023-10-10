import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_body.freezed.dart';
part 'login_request_body.g.dart';

@freezed
class LoginRequestBody with _$LoginRequestBody{
  const factory LoginRequestBody(String email, String password) = _LoginRequestBody;

  factory LoginRequestBody.fromJson(Map<String, Object?> json) => _$LoginRequestBodyFromJson(json);
}