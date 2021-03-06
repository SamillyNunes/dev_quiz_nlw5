import 'package:dev_quiz/core/app_routes.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/routers/routers.dart';
import 'package:dev_quiz/view/home/widgets/score_card/score_card_widget.dart';
import 'package:dev_quiz/view/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final BuildContext context;
  AppBarWidget({required this.user, required this.context})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 270,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.settingsRoute,
                            arguments: SettingsPageArgs(user: user),
                          );
                        },
                        child: Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                user.photoUrl,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(
                    scorePercentage: (user.score / 100).toDouble(),
                  ),
                ),
              ],
            ),
          ),
        );
}
