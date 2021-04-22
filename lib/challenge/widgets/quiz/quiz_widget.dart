import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 257,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                question.title,
                style: AppTextStyles.heading,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          // esses tres pontinhos chamam "squid", que vai concatenar a lista
          ...question.answers
              .map(
                (answer) => AnswerWidget(
                  isRight: answer.isRight,
                  title: answer.title,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
