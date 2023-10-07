import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_handler_response.freezed.dart';
part 'auth_handler_response.g.dart';

@freezed
class AuthHandlerResponse with _$AuthHandlerResponse{
  const factory AuthHandlerResponse(int? user_id, String status) = _AuthHandlerResponse;

  factory AuthHandlerResponse.fromJson(Map<String, Object?> json) => _$AuthHandlerResponseFromJson(json);
}