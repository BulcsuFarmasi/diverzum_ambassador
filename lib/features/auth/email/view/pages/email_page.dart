import 'package:diverzum_ambassador/shared/app_colors.dart';
import 'package:diverzum_ambassador/shared/auth_scaffold.dart';
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
    return const AuthScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lépj be vagy hozz létre fiókot',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.titleColor),
        ),
      ],
    ));
  }
}
