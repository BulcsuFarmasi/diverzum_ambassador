import 'package:diverzum_ambassador/features/auth/data/login_errors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_body.freezed.dart';
part 'login_response_body.g.dart';

@freezed
class LoginResponseBody with _$LoginResponseBody{
  // ignore: non_constant_identifier_names
  const factory LoginResponseBody({String? access_token, LoginErrors? errors}) = _LoginResponseBody;

  factory LoginResponseBody.fromJson(Map<String, Object?> json) => _$LoginResponseBodyFromJson(json);
}