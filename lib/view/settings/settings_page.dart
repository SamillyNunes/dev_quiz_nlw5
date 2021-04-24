import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/view/settings/widgets/settings_tile.dart';
import 'package:dev_quiz/view/shared/widgets/gradient_app_bar_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: GradientAppBarWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  ),
                ),
              ),
              Text(
                "Configurações",
                style: AppTextStyles.titleBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(250),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: deviceSize.width * 0.1,
          vertical: deviceSize.height * 0.05,
        ),
        child: Column(
          children: [
            SettingsTile(
              title: "Tema escuro",
            ),
          ],
        ),
      ),
    );
  }
}
