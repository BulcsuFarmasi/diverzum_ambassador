import 'package:diverzum_ambassador/features/auth/data/password_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_page_state.freezed.dart';

@freezed
sealed class PasswordPageState with _$PasswordPageState{
  const factory PasswordPageState.initial() = Initial;
  const factory PasswordPageState.success() = Success;
  const factory PasswordPageState.error(String password, PasswordError error) = Error;
}