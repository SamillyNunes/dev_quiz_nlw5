import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_routes.dart';
import 'package:dev_quiz/view/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  void setTheme(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("theme")) {
      String? savedTheme = prefs.getString("theme");
      print("saved theme: $savedTheme");
      Provider.of<SettingsController>(context, listen: false)
          .changeCurrentAppTheme(theme: savedTheme);
    }
  }

  @override
  Widget build(BuildContext context) {
    setTheme(context);

    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacementNamed(context, AppRoutes.loginRoute),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Image.asset(
            AppImages.logo,
          ),
        ),
      ),
    );
  }
}
