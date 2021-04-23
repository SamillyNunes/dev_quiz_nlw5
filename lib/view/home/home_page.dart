import 'package:dev_quiz/core/app_routes.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/routers/routers.dart';
import 'package:dev_quiz/view/home/home_controller.dart';
import 'package:dev_quiz/view/home/home_state.dart';
import 'package:dev_quiz/view/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/view/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/view/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:dev_quiz/view/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getQuizzes();
    // adicionando um recurso que vai ficar observando atualizacoes da variavel statenotifier
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          // perceba que aqui usamos o ! para garantir ao dart que o usuario nao sera nulo
          user: widget.user,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
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
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: controller.quizzes!
                      .map(
                        (quiz) => QuizCardWidget(
                          title: quiz.title,
                          completed: quiz.questionsAnswered,
                          totalQuestions: quiz.questions.length,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.challengeRoute,
                              arguments: ChallengePageArgs(
                                questions: quiz.questions,
                                quizTitle: quiz.title,
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }
  }
}
