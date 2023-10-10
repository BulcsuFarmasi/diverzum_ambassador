import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primaryColor = MaterialColor(_primaryColorPrimaryValue, <int, Color>{
    50: Color(0xFFF4EBF8),
    100: Color(0xFFE4CDEE),
    200: Color(0xFFD3ACE3),
    300: Color(0xFFC18BD8),
    400: Color(0xFFB372CF),
    500: Color(_primaryColorPrimaryValue),
    600: Color(0xFF9E51C1),
    700: Color(0xFF9548BA),
    800: Color(0xFF8B3EB3),
    900: Color(0xFF7B2EA6),
  });
  static const int _primaryColorPrimaryValue = 0xFFA659C7;

  static const authBackgroundColor = Color(0xFFFFFFFF);
  static const titleColor = Color(0xFF252A2F);
  static const borderColor = Color(0xFFE0E3E6);
  static const textColor = Color(0xFF929497);
  static const backgroundColor = Color(0xFFF5F9FC);
  static const tableOddRowColor = Color(0xFFF9F9F9);
  static const paginationTextColor = Color(0xFF0D6EFD);
  static const paginationActiveTextColor = Color(0xFFFFFFFF);
  static const paginationDisabledTextColor = Color(0xBF212529);
  static const paginationBackgroundColor = Color(0xFFFFFFFF);
  static const paginationActiveBackgroundColor = Color(0xFF0D6EFD);
  static const paginationDisabledBackgroundColor = Color(0xFFE9ECEF);
  static const paginationBorderColor = Color(0xFFDEE2E6);
  static const paginationActiveBorderColor = Color(0xFF0D6EFD);
  static const tableShadowColor = Color(0xFF7A7A7D);
  static const errorColor = Color(0xFFF9226F);
  static const disabledButtonColor = Color(0xFFF6F8FB);
  static const disabbledButtonTextColor = Color(0xFFC8CDD0);
  static const disabbledButtonBorderColor = Color(0xFFE0E3E6);
  static const buttonTextColor = Color(0xFFFFFFFF);
}
