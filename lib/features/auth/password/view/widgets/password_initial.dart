

import 'package:diverzum_ambassador/features/auth/password/controller/password_page_state_notifier.dart';
import 'package:diverzum_ambassador/shared/widgets/app_colors.dart';
import 'package:diverzum_ambassador/shared/auth_scaffold.dart';
import 'package:diverzum_ambassador/shared/widgets/custom_back_button.dart';
import 'package:diverzum_ambassador/shared/widgets/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordInitial extends ConsumerStatefulWidget {
  const PasswordInitial({super.key});

  @override
  ConsumerState<PasswordInitial> createState() => _PasswordInitialState();
}

class _PasswordInitialState extends ConsumerState<PasswordInitial> {

  String? _password;
  bool _passwordVisible = false;

  void _changePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _changePassword(String newPassword) {
    _password = newPassword;
  }

  void _login() {
    ref.read(passwordPageStateNotifierProvider.notifier).login(_password!);
  }

  Widget build(BuildContext context) {
    return AuthScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomBackButton(),
                Expanded(
                  child: Text(
                    'Lépj be',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.titleColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Van fiókod, kérjük tölsd ki az alábbi mezőt.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColor),
            ),
            const SizedBox(
              height: 24,
            ),
            const TextFieldLabel(label: 'Jelszó'),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: 'Jelszó',
                prefix: const FaIcon(FontAwesomeIcons.key, size: 14,),
                suffix: IconButton(
                  onPressed: _changePasswordVisibility,
                  icon: FaIcon(_passwordVisible ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye, size: 14,),
                ),
              ),
              onChanged: _changePassword,
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: _login,
              child: const Text(
                'Belépés',
              ),
            ),
          ],
        ),
      ),
    );
  }
}