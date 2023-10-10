import 'package:diverzum_ambassador/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AmbassadorPageLoadError extends StatelessWidget {
  const AmbassadorPageLoadError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Nem sikerült be tölteni a táblázatot',
        style: TextStyle(color: AppColors.errorColor, fontSize: 18),
      ),
    );
  }
}
