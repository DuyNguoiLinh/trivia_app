
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/respository/quiz_respository.dart';

class AsyncQuizNotifier extends AsyncNotifier<List<QuestionEntity>> {
  final quizRespository= QuizRespository.create();
  @override
  FutureOr<List<QuestionEntity>> build() {
    // return List.empty(growable: true);
    return _initQuestionsData(10, 12 , 'medium');
  }
  Future<List<QuestionEntity>> _initQuestionsData(int amount , int idCategory, String? difficulty) async{
       try{
         final questionsData= await quizRespository.fetchQuestions(amount, idCategory, difficulty);
         return questionsData;
       } catch(err){
         return List.empty(growable: true);
       }

    }
  Future<void> saveUseName(String name) async {
      quizRespository.saveUserName(name);
  }
}

final asyncQuizProvider=AsyncNotifierProvider<AsyncQuizNotifier,List<QuestionEntity>> (() {
  return AsyncQuizNotifier();
});
