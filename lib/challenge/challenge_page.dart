import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/result/result_page.dart';
import 'package:flutter/material.dart';

import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String quizTitle;

  const ChallengePage(
      {Key? key, required this.questions, required this.quizTitle})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
  }

  void onSelected(bool isRight) {
    if (isRight) {
      controller.qtdRightAnswers++;
    }
    nextPage();
  }

  @override
  void initState() {
    pageController.addListener(
      () {
        controller.currentPage = pageController.page!.toInt() + 1;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(102),
        child: SafeArea(
          //utilizado para que o conteudo da appbar nao fique por baixo da barra de bateria
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              // o value listenable vai fazer o rebuild so nesse componente quando houver atualizacoes
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  pagesLenght: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (question) => QuizWidget(
                question: question,
                onAnswerSelected: (valueIsRight) {
                  onSelected(valueIsRight);
                },
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        // para evitar que os botoes inferiores do dispositivo fiquem por cima
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: ValueListenableBuilder(
            valueListenable: controller.currentPageNotifier,
            builder: (context, int value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (value < widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "Pular",
                      onTap: nextPage,
                    ),
                  ),
                if (value == widget.questions.length)
                  SizedBox(
                    width: 7,
                  ),
                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: "Confirmar",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultPage(
                              quizTitle: widget.quizTitle,
                              questionsLenght: widget.questions.length,
                              result: controller.qtdRightAnswers,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
