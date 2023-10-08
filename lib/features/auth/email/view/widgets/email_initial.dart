import 'package:diverzum_ambassador/features/auth/email/controller/email_page_state_notifier.dart';
import 'package:diverzum_ambassador/shared/widgets/app_colors.dart';
import 'package:diverzum_ambassador/shared/widgets/auth_scaffold.dart';
import 'package:diverzum_ambassador/shared/widgets/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailInitial extends ConsumerStatefulWidget {
  const EmailInitial({super.key, this.email});

  final String? email;

  @override
  ConsumerState<EmailInitial> createState() => _EmailInitialState();
}

class _EmailInitialState extends ConsumerState<EmailInitial> {
  String? _email;

  void _checkEmail() {
    ref.read(emailPageStateProvider.notifier).checkEmail(_email!);
  }

  void _changeEmail(String? newEmail) {
    _email = newEmail;
  }

  @override
  void initState() {
    super.initState();
    _email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: SingleChildScrollView(
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
              decoration: const InputDecoration(
                hintText: 'E-mail cím',
                prefix: FaIcon(
                  FontAwesomeIcons.envelope,
                  size: 14,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: _changeEmail,
              initialValue: _email,
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: _checkEmail,
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
                      'Látogass el a diverzum adat védelmi nyilatkozatára, hogy többet megtudj a személyes adatok feldolgozásáról ',
                  style: TextStyle(fontSize: 14, color: AppColors.textColor),
                  children: [
                    TextSpan(
                      text: 'a szerződési feltételekről, ',
                      style:
                          TextStyle(fontSize: 14, color: AppColors.primaryColor, decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: 'adatvédelmi irányelvekről',
                      style:
                          TextStyle(fontSize: 14, color: AppColors.primaryColor, decoration: TextDecoration.underline),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
