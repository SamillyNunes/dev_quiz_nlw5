import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChanged;
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChanged,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

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
                widget.question.title,
                style: AppTextStyles.heading,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          for (int i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answerModel: answer(i),
              isSelected: indexSelected == i,
              isDisabled: indexSelected !=
                  -1, //se for diferente de -1, ele ja clicou em alguem, logo n pode mais
              onTap: () {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((value) => widget.onChanged());
              },
            ),
        ],
      ),
    );
  }
}
