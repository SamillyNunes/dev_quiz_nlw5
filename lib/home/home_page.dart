import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LevelButtonWidget(
              label: "Fácil",
            ),
            LevelButtonWidget(
              label: "Médio",
            ),
            LevelButtonWidget(
              label: "Difícil",
            ),
            LevelButtonWidget(
              label: "Perito",
            ),
          ],
        ),
      ),
    );
  }
}
