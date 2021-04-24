import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

import 'package:dev_quiz/core/app_text_styles.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  const SettingsTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.heading,
        ),
        Switch(
          value: true,
          onChanged: (v) {},
          activeColor: AppColors.purple,
        ),
      ],
    );
  }
}
