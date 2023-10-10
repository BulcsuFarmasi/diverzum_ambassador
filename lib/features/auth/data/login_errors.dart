import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_errors.freezed.dart';
part 'login_errors.g.dart';

@freezed
class LoginErrors with _$LoginErrors{
  const factory LoginErrors(List<String> password) = _LoginErrors;

  factory LoginErrors.fromJson(Map<String, Object?> json) => _$LoginErrorsFromJson(json);
}