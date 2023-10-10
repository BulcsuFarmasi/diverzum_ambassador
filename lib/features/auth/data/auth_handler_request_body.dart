import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_handler_request_body.freezed.dart';
part 'auth_handler_request_body.g.dart';

@freezed
class AuthHandlerRequestBody  with _$AuthHandlerRequestBody{
  const factory AuthHandlerRequestBody (String email) = _AuthHandlerRequestBody;

  factory AuthHandlerRequestBody.fromJson(Map<String, Object?> json) => _$AuthHandlerRequestBodyFromJson(json);
}