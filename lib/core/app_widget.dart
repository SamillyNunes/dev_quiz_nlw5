import 'package:dev_quiz/routers/routers.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      // home: SettingsPage(),
      initialRoute: "/",
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
