import 'dart:convert';

import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    // o rootBundle vai acessar os arquivos
    final response = await rootBundle.loadString("database/user.json");
    // convertendo de json para usermodel
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    //acessando os arquivos
    final response = await rootBundle.loadString("database/quizzes.json");
    //convertendo o json para uma lista, ja que eh uma
    final list = json.decode(response) as List;
    //convertendo de mapa para quiz model
    final quizzes = list.map((quizMap) => QuizModel.fromMap(quizMap)).toList();
    return quizzes;
  }
}
