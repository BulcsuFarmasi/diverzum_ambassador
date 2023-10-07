import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_page_state.freezed.dart';

@freezed
sealed class PasswordPageState with _$PasswordPageState{
  const factory PasswordPageState.initial() = Initial;
  const factory PasswordPageState.success() = Success;
}