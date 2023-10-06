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

  static const backgroundColor = Color(0xFFFFFFFF);
  static const titleColor = Color(0xFF000000);
  static const textColor = Color(0xFF929497);
}