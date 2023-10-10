import 'package:diverzum_ambassador/features/ambassador/ambassador/view/pages/ambassador_page.dart';
import 'package:diverzum_ambassador/features/auth/password/controller/password_page_state.dart';
import 'package:diverzum_ambassador/features/auth/password/controller/password_page_state_notifier.dart';
import 'package:diverzum_ambassador/features/auth/password/view/widgets/password_form.dart';
import 'package:diverzum_ambassador/shared/widgets/auth_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordPage extends ConsumerWidget {
  const PasswordPage({super.key});

  static const routeName = '/password';

  void _navigateToAmbassadorPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AmbassadorPage.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(passwordPageStateNotifierProvider, (_, next) {
      switch (next) {
        case Success():
          _navigateToAmbassadorPage(context);
        default:
      }
    });
    final PasswordPageState passwordPageState = ref.watch(passwordPageStateNotifierProvider);
    return AuthScaffold(
      body: SingleChildScrollView(
        child: switch (passwordPageState) {
          Initial() => const PasswordForm(),
          Error error => PasswordForm(password: error.password, loginFailed: true),
          _ => const SizedBox(),
        },
      ),
    );
  }
}
