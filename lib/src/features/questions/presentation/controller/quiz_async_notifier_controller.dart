
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/respository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/parametter_controller.dart';

class AsyncQuizNotifier extends AsyncNotifier<List<QuestionEntity>> {
  final quizRespository= QuizRespository.create();
  @override
  FutureOr<List<QuestionEntity>> build() {
     final parameter=ref.read(parameterProvider.notifier).getParameter();
     print(parameter['amount']);
     print(parameter['idCategory']);
     print(parameter['difficulty']);
     print(parameter['type']);
    return  _initQuestionsData(parameter['amount'], parameter['idCategory'], parameter['difficulty'], parameter['type']);
  }
  Future<List<QuestionEntity>> _initQuestionsData(int amount ,int idCategory, String? difficulty,String? type ) async{
       try{
         final questionsData= await quizRespository.fetchQuestions(amount, idCategory, difficulty,type);
         return questionsData;
       } catch(err){
         print(err);
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
