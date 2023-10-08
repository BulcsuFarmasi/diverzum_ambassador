import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in_response.freezed.dart';
part 'log_in_response.g.dart';

@freezed
class LogInResponse with _$LogInResponse{
  const factory LogInResponse(String access_token) = _LogInResponse;

  factory LogInResponse.fromJson(Map<String, Object?> json) => _$LogInResponseFromJson(json);
}