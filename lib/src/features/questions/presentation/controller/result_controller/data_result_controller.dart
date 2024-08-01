import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/result_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

class AsyncDataResultNotifier extends AutoDisposeAsyncNotifier<ResultEntity> {

  final _quizRepository= QuizRepository.create();
  final _userRepository =UserRepository.create();

  @override
  FutureOr<ResultEntity> build() {
    return   _analysisQuiz();
  }
  // analysis Quiz include : completion , Total , Correct, Wrong
  Future<ResultEntity> _analysisQuiz() async {

    int correctCount = 0;
    final listQuestion=ref.read(questionProvider.notifier).getQuestions();

    correctCount=listQuestion.where((e) => e.answerUser==e.correctAnswer).toList().length;

     final amountCoinEarn = (correctCount/listQuestion.length)*10;
     final roundedAmountCoinEarn = (amountCoinEarn * 100).round() / 100;

    // save , update coin
     await _userRepository.additionCoin(roundedAmountCoinEarn);
     //  obj results
     final resultEntity = ResultEntity(total: listQuestion.length,
        completion: (correctCount/listQuestion.length)*100,
        correct: correctCount,
        wrong: (listQuestion.length-correctCount),
        coin: roundedAmountCoinEarn
    );

    print(resultEntity.correct);
    await _quizRepository.saveResultQuiz(resultEntity);
    // state =AsyncValue.data(resultEntity);
    return resultEntity;
  }
}

final dataResultProvider = AsyncNotifierProvider.autoDispose<
    AsyncDataResultNotifier,
    ResultEntity>(() {
  return AsyncDataResultNotifier();
});