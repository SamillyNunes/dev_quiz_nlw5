import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static Color backgroundColors(Brightness brightness) =>
      brightness == Brightness.light ? AppColors.white : Color(0xFF333333);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.black,
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: AppColors.white,
    brightness: Brightness.dark,
  );
}
