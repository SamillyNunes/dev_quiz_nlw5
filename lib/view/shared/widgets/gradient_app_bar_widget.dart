import 'package:flutter/material.dart';

import 'package:dev_quiz/core/core.dart';

class GradientAppBarWidget extends StatelessWidget {
  final Widget child;
  const GradientAppBarWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        gradient: AppGradients.linear,
      ),
      child: child,
    );
  }
}