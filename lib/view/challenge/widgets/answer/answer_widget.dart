import 'package:dev_quiz/core/app_theme.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/view/settings/settings_controller.dart';
import 'package:dev_quiz/view/shared/models/answer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answerModel;
  final bool isSelected;
  final bool isDisabled;
  final ValueChanged<bool> onTap;

  const AnswerWidget({
    Key? key,
    required this.answerModel,
    required this.onTap,
    this.isSelected = false,
    this.isDisabled = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      answerModel.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answerModel.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answerModel.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answerModel.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => answerModel.isRight
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight =>
      answerModel.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController =
        Provider.of<SettingsController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      // ignore pointer vai desativar o recurso de clique em um botao, por exemplo
      child: IgnorePointer(
        ignoring: isDisabled,
        child: GestureDetector(
          onTap: () {
            //devolvendo se a resposta eh certa ou errada
            onTap(answerModel.isRight);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? _selectedColorCardRight
                  : AppTheme.backgroundColors(
                      settingsController.currentAppTheme.brightness),
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(
                color: isSelected ? _selectedBorderCardRight : AppColors.border,
              )),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answerModel.title,
                    style: isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body.copyWith(
                            color:
                                settingsController.currentAppTheme.primaryColor,
                          ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: isSelected
                        ? _selectedColorRight
                        : AppTheme.backgroundColors(
                            settingsController.currentAppTheme.brightness),
                    border: Border.fromBorderSide(BorderSide(
                      color:
                          isSelected ? _selectedBorderRight : AppColors.border,
                    )),
                  ),
                  child: isSelected
                      ? Icon(
                          _selectedIconRight,
                          size: 16,
                          color: AppColors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
