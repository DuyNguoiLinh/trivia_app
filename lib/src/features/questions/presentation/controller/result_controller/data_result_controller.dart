import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/result_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';
import '../../../../user/global_variables.dart';


class AsyncDataResultNotifier extends AutoDisposeAsyncNotifier<ResultEntity> {
  final _quizRepository = QuizRepository.create();
  final _userRepository = UserRepository.create();


  @override
  FutureOr<ResultEntity> build() {


    return _analysisQuiz();
  }

  // analysis Quiz include : completion , Total , Correct, Wrong
  Future<ResultEntity> _analysisQuiz() async {
    try {
      int correctCount = 0;
      final listQuestion = ref.read(questionProvider.notifier).getQuestions();

      correctCount = listQuestion
          .where((e) => e.answerUser == e.correctAnswer)
          .toList()
          .length;

      final amountCoinEarn = (correctCount / listQuestion.length) * 10;
      final  roundedAmountCoinEarn = (amountCoinEarn * 100).round() / 100;

      // save , update coin
      await _userRepository.addCoin(roundedAmountCoinEarn,uidGlobal);

      //  obj results
      final resultEntity = ResultEntity(
          total: listQuestion.length,
          completion: (correctCount / listQuestion.length) * 100,
          correct: correctCount,
          wrong: (listQuestion.length - correctCount),
          coin: roundedAmountCoinEarn);

      await _quizRepository.saveResultQuiz(resultEntity);

      return resultEntity;
    } catch (err) {
      return Future.error(err);
    }


  }
}

final dataResultProvider =
    AsyncNotifierProvider.autoDispose<AsyncDataResultNotifier, ResultEntity>(
        () {
  return AsyncDataResultNotifier();
});
