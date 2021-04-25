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

  double get percentage => this.result / this.questionsLenght;

  String get resultImage => this.percentage < 0.5
      ? AppImages.badResult
      : ((this.percentage < 1 && this.percentage > 0.5)
          ? AppImages.mediumResult
          : AppImages.trophy);

  String get title => this.percentage < 0.5
      ? "Que triste!"
      : ((this.percentage < 1 && this.percentage > 0.5)
          ? "Continue assim!"
          : "Parabéns!");

  String get subtitle => this.percentage < 0.5
      ? "Você só fez $result de $questionsLenght questões. Tente novamente para fixar o conhecimento"
      : ((this.percentage < 1 && this.percentage > 0.5)
          ? "Você fez $result de $questionsLenght questões. Siga tentando e você chegará lá!"
          : "Você acertou $result de $questionsLenght questões! Mostra a sua excelência!");

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
              resultImage,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            Column(
              children: [
                Text(
                  this.title,
                  style: AppTextStyles.heading40.copyWith(
                    color: settingsController.currentAppTheme.primaryColor,
                  ),
                ),
                Container(
                  width: 189,
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    this.subtitle,
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
