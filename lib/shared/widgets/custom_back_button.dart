import 'package:diverzum_ambassador/shared/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  void _navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _navigateBack(context);
      },
      icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: AppColors.textColor, size: 14),
    );
  }
}
