import 'package:diverzum_ambassador/features/auth/email/controller/email_page_state.dart';
import 'package:diverzum_ambassador/features/auth/email/controller/email_page_state_notifier.dart';
import 'package:diverzum_ambassador/features/auth/email/view/widgets/email_form.dart';
import 'package:diverzum_ambassador/features/auth/password/view/pages/password_page.dart';
import 'package:diverzum_ambassador/shared/widgets/auth_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailPage extends ConsumerWidget {
  const EmailPage({super.key});

  void navigateToPasswordPage(BuildContext context) {
    Navigator.of(context).pushNamed(PasswordPage.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(emailPageStateProvider, (_, next) {
      switch (next) {
        case Success():
          navigateToPasswordPage(context);
        default:
      }
    });
    final EmailPageState state = ref.watch(emailPageStateProvider);
    return AuthScaffold(
      body: SingleChildScrollView(
        child: switch (state) {
          Initial() => const EmailForm(),
          Success success => EmailForm(
              email: success.email,
            ),
          Error error => EmailForm(email: error.email, error: error.error)
        },
      ),
    );
  }
}
