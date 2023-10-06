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
    return AuthScaffold(body: Container());
  }
}
