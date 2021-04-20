import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.border,
          ),
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(
              AppImages.blocks,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Gerenciamento de Estado",
            style: AppTextStyles.heading15,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "3 de 10",
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 2,
                child: ProgressIndicatorWidget(
                  value: 0.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
