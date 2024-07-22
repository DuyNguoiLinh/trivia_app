
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/respository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/option_controller/parametter_controller.dart';

class AsyncQuizNotifier extends AsyncNotifier<List<QuestionEntity>> {
  final quizRespository= QuizRespository.create();
  @override
  FutureOr<List<QuestionEntity>> build() {
     // final parameter=ref.read(parameterProvider.notifier).getParameter();
     // print(parameter['amount']);
     // print(parameter['idCategory']);
     // print(parameter['difficulty']);
     // print(parameter['type']);
     // final asyncQuestion=await _initQuestionsData(parameter['amount'], parameter['idCategory'], parameter['difficulty'], parameter['type']) ;
     // state=AsyncValue.data([...asyncQuestion]);
     return List<QuestionEntity>.empty(growable: true);
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
  Future<void> fetchNewQuiz() async {
    final parameter = ref.read(parameterProvider.notifier).getParameter();
    state = const AsyncValue.loading();
    try {
      final questions = await _initQuestionsData(
          parameter['amount'],
          parameter['idCategory'],
          parameter['difficulty'],
          parameter['type']
      );
      state = AsyncValue.data([...questions]);
    } catch (e, stackTr) {
      state = AsyncValue.error(e, stackTr);
    }
  }

  Future<void> saveUseName(String name) async {
      await quizRespository.saveUserName(name);
  }
  Future<String> getInfoUser() async{
  try{
    return await quizRespository.getInfoUser();
  } catch (err){
    return '';
  }
  }
}

final asyncQuizProvider=AsyncNotifierProvider<AsyncQuizNotifier,List<QuestionEntity>> (() {
  return AsyncQuizNotifier();
});
