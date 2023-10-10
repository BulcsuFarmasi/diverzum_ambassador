import 'package:diverzum_ambassador/features/auth/data/email_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_page_state.freezed.dart';

@freezed
sealed class EmailPageState with _$EmailPageState{
  factory EmailPageState.initial() = Initial;
  factory EmailPageState.success(String email) = Success;
  factory EmailPageState.error(String email, EmailError error) = Error;
}