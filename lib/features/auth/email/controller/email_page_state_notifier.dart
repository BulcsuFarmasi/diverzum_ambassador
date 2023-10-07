import 'package:diverzum_ambassador/features/auth/email/controller/email_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<EmailPageStateNotifier, EmailPageState> emailPageStateProvider =
    StateNotifierProvider<EmailPageStateNotifier, EmailPageState>((ref) => EmailPageStateNotifier());

class EmailPageStateNotifier extends StateNotifier<EmailPageState> {
  EmailPageStateNotifier() : super(EmailPageState.initial());

  void checkEmail(String email) {

  }
}
