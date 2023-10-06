import 'package:diverzum_ambassador/features/ambassador/ambassador/view/pages/ambassador_page.dart';
import 'package:diverzum_ambassador/features/auth/email/view/pages/email_page.dart';
import 'package:diverzum_ambassador/features/auth/password/view/pages/password_page.dart';
import 'package:diverzum_ambassador/shared/app_colors.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          hintStyle: const TextStyle(color: AppColors.textColor, fontSize: 14),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: const Size.fromHeight(44),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const EmailPage(),
        PasswordPage.routeName: (_) => const PasswordPage(),
        AmbassadorPage.routeName: (_) => const AmbassadorPage(),
      },
    );
  }
}
