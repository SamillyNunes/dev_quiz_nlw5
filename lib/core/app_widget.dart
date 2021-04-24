import 'package:dev_quiz/routers/routers.dart';
import 'package:dev_quiz/view/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => SettingsController(),
      child: MaterialApp(
        title: "DevQuiz",
        debugShowCheckedModeBanner: false,
        // home: SettingsPage(),
        initialRoute: "/",
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
