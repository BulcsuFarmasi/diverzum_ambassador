import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_handler_request.freezed.dart';
part 'auth_handler_request.g.dart';

@freezed
class AuthHandlerRequest  with _$AuthHandlerRequest{
  const factory AuthHandlerRequest (String email) = _AuthHandlerRequest;

  factory AuthHandlerRequest.fromJson(Map<String, Object?> json) => _$AuthHandlerRequestFromJson(json);
}