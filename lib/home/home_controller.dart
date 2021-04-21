import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  // O value notifier eh um tipo de notificador advindo do proprio flutter, sem precisar de uma biblioteca
  final ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(
      name: "Samilly",
      photoUrl: 'https://avatars.githubusercontent.com/u/37520136?v=4',
    );

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
        title: "NLW 5 Flutter",
        image: AppImages.blocks,
        level: Level.facil,
        questionsAnswered: 1,
        questions: [
          QuestionModel(
            title: "Está curtindo o Flutter?",
            answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Não muito"),
              AnswerModel(
                title: "Show de bola",
                isRight: true,
              ),
              AnswerModel(title: "Muito bom!"),
            ],
          ),
          QuestionModel(
            title: "Como vai o curso?",
            answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Não muito", isRight: true),
              AnswerModel(title: "Show de bola"),
              AnswerModel(title: "Muito bom!"),
            ],
          ),
        ],
      ),
    ];
    state = HomeState.success;
  }
}
