import 'package:diverzum_ambassador/features/auth/password/controller/password_page_state_notifier.dart';
import 'package:diverzum_ambassador/shared/app_colors.dart';
import 'package:diverzum_ambassador/shared/app_validators.dart';
import 'package:diverzum_ambassador/shared/widgets/auth_scaffold.dart';
import 'package:diverzum_ambassador/shared/widgets/custom_back_button.dart';
import 'package:diverzum_ambassador/shared/widgets/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordForm extends ConsumerStatefulWidget {
  const PasswordForm({
    this.password,
    this.loginFailed,
    super.key,
  });

  final String? password;
  final bool? loginFailed;

  @override
  ConsumerState<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends ConsumerState<PasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _formValid = false;
  String? _password;
  bool? _loginFailed;

  void _changePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _login() {
    ref.read(passwordPageStateNotifierProvider.notifier).login(_password!);
  }

  @override
  void didUpdateWidget(covariant PasswordForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    _password = widget.password;
    _loginFailed = widget.loginFailed;
  }

  void _changePassword(String? newPassword) {
    _loginFailed = null;
    setState(() {
      _validateForm();
      _password = newPassword;
    });
  }

  String? _validatePassword(String? password) {
    String? errorMessage;
    const int minLength = 6;
    if (AppValidators.required(password)) {
      errorMessage = 'Kérjük adj meg egy jelszót';
    } else if (AppValidators.minLength(password!, minLength)) {
      errorMessage = 'Kérjük legalább $minLength karaktert adj meg.';
    }
    return errorMessage;
  }

  void _validateForm() {
    _formValid = _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Stack(
            children: [
              Positioned(top: -10, left: 0, child: CustomBackButton()),
              Center(
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
              prefixIcon: const Icon(
                FontAwesomeIcons.key,
                size: 14,
              ),
              suffixIcon: IconButton(
                onPressed: _changePasswordVisibility,
                icon: FaIcon(
                  _passwordVisible ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  size: 14,
                ),
              ),
              prefixIconColor: (_password?.isNotEmpty ?? false)
                  ? (!_formValid || (_loginFailed ?? false) ? AppColors.errorColor : AppColors.primaryColor)
                  : AppColors.textColor,
              suffixIconColor: (_password?.isNotEmpty ?? false)
                  ? ((!_formValid || (_loginFailed ?? false)) ? AppColors.errorColor : AppColors.primaryColor)
                  : AppColors.textColor,
              errorText: _loginFailed ?? false ? 'Az e-mail vagy a  jelszó nem jó' : null,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: _changePassword,
            validator: _validatePassword,
          ),
          const SizedBox(
            height: 16,
          ),
          FilledButton(
            onPressed: _formValid ? _login : null,
            child: const Text(
              'Belépés',
            ),
          ),
        ],
      ),
    );
  }
}
