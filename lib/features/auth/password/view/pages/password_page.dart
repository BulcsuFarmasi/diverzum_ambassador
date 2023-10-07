import 'package:diverzum_ambassador/shared/app_colors.dart';
import 'package:diverzum_ambassador/shared/auth_scaffold.dart';
import 'package:diverzum_ambassador/shared/custom_back_button.dart';
import 'package:diverzum_ambassador/shared/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  static const routeName = '/password';

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  bool passwordVisible = false;

  void _changePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void _signIn() {}

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
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                hintText: 'Jelszó',
                prefix: const FaIcon(FontAwesomeIcons.key, size: 14,),
                suffix: IconButton(
                  onPressed: _changePasswordVisibility,
                  icon: FaIcon(passwordVisible ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye, size: 14,),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: _signIn,
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
