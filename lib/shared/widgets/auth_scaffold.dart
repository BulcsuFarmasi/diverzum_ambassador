import 'package:diverzum_ambassador/shared/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/auth_background.jpg',
            fit: BoxFit.fill,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.65,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.authBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                child: body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
