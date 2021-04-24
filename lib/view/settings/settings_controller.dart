import 'package:dev_quiz/core/app_theme.dart';
import 'package:flutter/material.dart';

class SettingsController {
  ValueNotifier<ThemeData> themeNotifier =
      ValueNotifier<ThemeData>(AppTheme.lightTheme);
  ThemeData get currentAppTheme => themeNotifier.value;
  set currentAppTheme(ThemeData value) => themeNotifier.value = value;

  void changeCurrentAppTheme() {
    if (currentAppTheme == AppTheme.lightTheme) {
      print("entrou aqui!");
      currentAppTheme = AppTheme.darkTheme;
    } else if (currentAppTheme == AppTheme.darkTheme) {
      currentAppTheme = AppTheme.lightTheme;
    }
  }
}
