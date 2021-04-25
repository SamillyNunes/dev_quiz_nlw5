import 'package:dev_quiz/routers/routers.dart';
import 'package:dev_quiz/view/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider<SettingsController>(
      create: (context) => SettingsController(),
      builder: (context, _)=> MaterialApp(
        title: "DevQuiz",
        debugShowCheckedModeBanner: false,
        // home: SettingsPage(),
        initialRoute: "/",
        onGenerateRoute: AppRouter.generateRoute,
        theme: context.watch<SettingsController>().currentAppTheme,
      ),
    );
  }
}
