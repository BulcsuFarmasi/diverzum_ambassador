import 'package:diverzum_ambassador/features/auth/email/controller/email_page_state_notifier.dart';
import 'package:diverzum_ambassador/shared/app_colors.dart';
import 'package:diverzum_ambassador/shared/app_validators.dart';
import 'package:diverzum_ambassador/shared/widgets/auth_scaffold.dart';
import 'package:diverzum_ambassador/shared/widgets/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailForm extends ConsumerStatefulWidget {
  const EmailForm({super.key, this.email, this.emailNotExists});

  final String? email;
  final bool? emailNotExists;

  @override
  ConsumerState<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends ConsumerState<EmailForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _formValid = false;

  String? _email;
  bool? _emailNotExists;

  @override
  void didUpdateWidget(covariant EmailForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    _email = widget.email;
    _emailNotExists = widget.emailNotExists;
  }

  void _checkEmail() {
    ref.read(emailPageStateProvider.notifier).checkEmail(_email!);
  }

  void _changeEmail(String? newEmail) {
    _emailNotExists = null;
    setState(() {
      _validateForm();
      _email = newEmail;
    });
  }

  String? _validateEmail(String? email) {
    String? errorMessage;
    if (AppValidators.required(email)) {
      errorMessage = 'Kérjük adj meg egy e-mail címet';
    } else if (AppValidators.email(email!)) {
      errorMessage = 'Kérjük érvényes e-mail címet adj meg.';
    }
    return errorMessage;
  }

  void _validateForm() {
    _formValid = _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lépj be vagy hozz létre fiókot',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.titleColor),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Ha már rendelkezel Diverzum fiókkal, akkor most beléphetsz. Ha még nincs ilyen fiókod, akkor létrehozunk neked egyet.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColor),
              ),
              const SizedBox(
                height: 24,
              ),
              const TextFieldLabel(label: 'E-mail cím'),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'E-mail cím',
                  prefixIcon: const Icon(
                    FontAwesomeIcons.envelope,
                    size: 14,
                  ),
                  errorText: _emailNotExists ?? false ? 'Az e-mail cím nem található' : null,
                  prefixIconColor: (_email?.isNotEmpty ?? false)
                      ? ((!_formValid || (_emailNotExists ?? false))
                          ? AppColors.errorColor
                          : AppColors.primaryColor)
                      : AppColors.textColor,
                  contentPadding: EdgeInsets.zero
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: _changeEmail,
                validator: _validateEmail,
                initialValue: _email,
              ),
              const SizedBox(
                height: 16,
              ),
              FilledButton(
                onPressed: _formValid ? _checkEmail : null,
                child: const Text(
                  'Folytatás',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: const TextSpan(
                    text:
                        'Látogass el a diverzum adatvédelmi nyilatkozatára, hogy többet megtudj a személyes adatok feldolgozásáról ',
                    style: TextStyle(fontSize: 14, color: AppColors.textColor),
                    children: [
                      TextSpan(
                        text: 'a szerződési feltételekről, ',
                        style: TextStyle(
                            fontSize: 14, color: AppColors.primaryColor, decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: 'adatvédelmi irányelvekről',
                        style: TextStyle(
                            fontSize: 14, color: AppColors.primaryColor, decoration: TextDecoration.underline),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
