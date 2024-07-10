
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/quiz_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/respository/quiz_respository.dart';

class AsyncQuizNotifier extends AsyncNotifier<List<QuizEntity>> {
  final quizRespository= QuizRespository.create();
  @override
  FutureOr<List<QuizEntity>> build() {
    return List.empty(growable: true);
  }
  Future<List<QuizEntity>> _initTodoData() async{
      return List.empty(growable: true);
    }
  Future<void> saveUseName(String name) async {
      quizRespository.saveUserName(name);
  }
}

final asyncQuizProvider=AsyncNotifierProvider<AsyncQuizNotifier,List<QuizEntity>> (() {
  return AsyncQuizNotifier();
});
