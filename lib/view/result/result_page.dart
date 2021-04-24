import 'package:dev_quiz/view/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/view/settings/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String quizTitle;
  final int questionsLenght;
  final int result;

  const ResultPage({
    Key? key,
    required this.quizTitle,
    required this.questionsLenght,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController =
        Provider.of<SettingsController>(context);

    return Scaffold(
      backgroundColor:
          settingsController.currentAppTheme.scaffoldBackgroundColor,
      body: Container(
        width: double.maxFinite, //o maximo possivel
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.trophy,
            ),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40.copyWith(
                    color: settingsController.currentAppTheme.primaryColor,
                  ),
                ),
                Container(
                  width: 189,
                  padding: const EdgeInsets.only(top: 16),
                  child: Text.rich(
                    TextSpan(
                      text: "Você concluiu ",
                      style: AppTextStyles.body.copyWith(
                        color: settingsController.currentAppTheme.primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: "\n${this.quizTitle}\n",
                          style: AppTextStyles.bodyBold.copyWith(
                            color:
                                settingsController.currentAppTheme.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: " com $result de $questionsLenght acertos.",
                          style: AppTextStyles.body.copyWith(
                            color:
                                settingsController.currentAppTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68.0),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                "Eu fiz $result de $questionsLenght acertos no DevQuiz_!");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68.0),
                        child: NextButtonWidget.transparent(
                          label: "Voltar ao inicio",
                          onTap: () {
                            //podemos usar o pop pq foi substituido do quiz para o resultado
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
