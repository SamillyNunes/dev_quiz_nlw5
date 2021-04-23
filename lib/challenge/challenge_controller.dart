import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier =
      ValueNotifier<int>(1); // notificador da pagina atual
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int qtdRightAnswers = 0;
}
