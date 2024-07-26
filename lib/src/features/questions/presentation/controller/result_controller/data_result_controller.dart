import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/result_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

class AsyncDataResultNotifier extends AutoDisposeAsyncNotifier<ResultEntity> {

  final quizRepository= QuizRepository.create();
  final userRepository =UserRepository.create();

  @override
  FutureOr<ResultEntity> build() {
    return   _analysisQuiz();
  }
  // analysis Quiz include : completion , Total , Correct, Wrong
  Future<ResultEntity> _analysisQuiz() async {

    int correctCount = 0;
    final listQuestion=await ref.watch(quizProvider.future);

    for (final question in listQuestion) {
      print(question.correctAnswer);
      print(question.answerUser);

      // count correct
      if (question.answerUser == question.correctAnswer) {
        correctCount++;
      }
    }
     final amountCoinEarn = (correctCount/listQuestion.length)*10;
     // save , update coin
     await userRepository.updateCoin(amountCoinEarn);
     //  obj results
     final resultEntity = ResultEntity(total: listQuestion.length,
        completion: (correctCount/listQuestion.length)*100,
        correct: correctCount,
        wrong: (listQuestion.length-correctCount),
        coin: amountCoinEarn
    );

    print(resultEntity.correct);
    await quizRepository.saveResultQuiz(resultEntity);
    // state =AsyncValue.data(resultEntity);
    return resultEntity;
  }
}

final dataResultProvider = AsyncNotifierProvider.autoDispose<
    AsyncDataResultNotifier,
    ResultEntity>(() {
  return AsyncDataResultNotifier();
});