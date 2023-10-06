import 'package:diverzum_ambassador/shared/app_colors.dart';
import 'package:diverzum_ambassador/shared/auth_scaffold.dart';
import 'package:diverzum_ambassador/shared/text_field_label.dart';
import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  static const routeName = '/email';

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lépj be vagy hozz létre fiókot',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.titleColor),
        ),
        const Text(
          'Ha már rendelkezel Diverzum fiókkal, akkor most beléphetsz. Ha még nincs ilyen fiókod, akkor létrehozunk neked egyet.',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColor),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextFieldLabel(label: 'E-mail cím'),
        TextFormField(
          decoration: const InputDecoration(hintText: 'E-mail cím'),
        ),
        const SizedBox(
          height: 8,
        ),
        FilledButton(
          onPressed: () {},
          child: const Text('Folytatás',),
        )
      ],
    ));
  }
}
