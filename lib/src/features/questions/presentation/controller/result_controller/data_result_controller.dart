import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/result_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';

class AsyncDataResultNotifier extends AsyncNotifier<ResultEntity?> {

  final Map<String, String> listDataStatistic = {};
  final quizRepository= QuizRepository.create();

  @override
  FutureOr<ResultEntity?> build() {
    return null;
  }
  // analysis Quiz include : completion , Total , Correct, Wrong
  Future<void> analysisQuiz() async {
    int correctCount = 0;
    final listQuestion = ref.read(questionProvider.notifier).getListQuestion();
    for (final question in listQuestion) {
      print(question.correctAnswer);
      print(question.answerUser);
      if (question.answerUser == question.correctAnswer) {
        correctCount++;
      }
    }
     final resultEntity = ResultEntity(total: listQuestion.length,
        completion: (correctCount/listQuestion.length)*100,
        correct: correctCount,
        wrong: (listQuestion.length-correctCount),
        coin: (correctCount/listQuestion.length)*10
    );
    print(resultEntity.correct);
    await quizRepository.saveResultQuiz(resultEntity);
    state =AsyncValue.data(resultEntity);
  }

}

final dataResultProvider = AsyncNotifierProvider<
    AsyncDataResultNotifier,
    ResultEntity?>(() {
  return AsyncDataResultNotifier();
});