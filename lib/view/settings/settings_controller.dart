import 'package:dev_quiz/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController {
  ValueNotifier<ThemeData> themeNotifier =
      ValueNotifier<ThemeData>(AppTheme.lightTheme);
  ThemeData get currentAppTheme => themeNotifier.value;
  set currentAppTheme(ThemeData value) => themeNotifier.value = value;

  void changeCurrentAppTheme({String? theme}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (theme != null) {
      if (theme.toLowerCase() == "dark") {
        _setDarkTheme(prefs);
      } else {
        _setLightTheme(prefs);
      }
    } else {
      if (currentAppTheme == AppTheme.lightTheme) {
        _setDarkTheme(prefs);
      } else if (currentAppTheme == AppTheme.darkTheme) {
        _setLightTheme(prefs);
      }
    }
  }

  void _setDarkTheme(SharedPreferences prefs) {
    currentAppTheme = AppTheme.darkTheme;
    prefs.setString("theme", "dark");
  }

  void _setLightTheme(SharedPreferences prefs) {
    currentAppTheme = AppTheme.lightTheme;
    prefs.setString("theme", "light");
  }
}
