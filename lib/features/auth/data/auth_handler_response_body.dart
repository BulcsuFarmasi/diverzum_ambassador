import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_handler_response_body.freezed.dart';
part 'auth_handler_response_body.g.dart';

@freezed
class AuthHandlerResponseBody with _$AuthHandlerResponseBody {
  const factory AuthHandlerResponseBody(String status) = _AuthHandlerResponseBody;

  factory AuthHandlerResponseBody.fromJson(Map<String, Object?> json) => _$AuthHandlerResponseBodyFromJson(json);
}