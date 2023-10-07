import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in_request.freezed.dart';
part 'log_in_request.g.dart';

@freezed
class LogInRequest with _$LogInRequest{
  const factory LogInRequest(String email, String password) = _LogInRequest;

  factory LogInRequest.fromJson(Map<String, Object?> json) => _$LogInRequestFromJson(json);
}