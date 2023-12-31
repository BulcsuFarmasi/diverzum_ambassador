import 'package:diverzum_ambassador/features/auth/data/email_error.dart';
import 'package:diverzum_ambassador/features/auth/email/controller/email_page_state.dart';
import 'package:diverzum_ambassador/features/auth/email/model/email_repository.dart';
import 'package:diverzum_ambassador/shared/http/network_excpetion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<EmailPageStateNotifier, EmailPageState> emailPageStateProvider =
    StateNotifierProvider<EmailPageStateNotifier, EmailPageState>(
        (ref) => EmailPageStateNotifier(ref.read(emailRepositoryProvider)));

class EmailPageStateNotifier extends StateNotifier<EmailPageState> {
  EmailPageStateNotifier(this._emailRepository) : super(EmailPageState.initial());

  final EmailRepository _emailRepository;

  void checkEmail(String email) async {
    try {
      final emailExists = await _emailRepository.checkEmail(email);

      state = (emailExists) ? EmailPageState.success(email) : EmailPageState.error(email, EmailError.emailNotFound);
    } on NetworkException {
      state = EmailPageState.error(email, EmailError.other);
    }
  }
}
