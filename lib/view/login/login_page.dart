import 'package:dev_quiz/core/app_routes.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/view/challenge/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: deviceSize.width * 0.1,
          vertical: deviceSize.height * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // color: Colors.red,
              child: Image.asset(
                AppImages.colorfulLogo,
              ),
            ),
            Container(
              width: deviceSize.width * 0.6,
              child: Column(
                children: [
                  Text(
                    "Bem-vindo ao \nDev Quiz!",
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                  Text(
                    "O aplicativo que vai elevar o seu sucesso!",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: NextButtonWidget.purple(
                    label: "Login",
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.homeRoute,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
