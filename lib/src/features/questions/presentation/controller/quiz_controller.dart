import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/option_controller/parametter_controller.dart';
// get questions by api
class QuestionApiNotifier
    extends AutoDisposeAsyncNotifier<List<QuestionEntity>> {

   final quizRepository = QuizRepository.create();
   List<QuestionEntity> listQuestion =
      List<QuestionEntity>.empty(growable: true);

  @override
  FutureOr<List<QuestionEntity>> build() {
    return _fetchNewQuiz();
  }

  Future<List<QuestionEntity>> _initQuestionsData(
      int amount, int idCategory, String? difficulty, String? type) async {

    try {
      final questionsData = await quizRepository.fetchQuestions(
        amount,
        idCategory,
        difficulty,
        type,
      );

      return questionsData;
    } catch (err) {
      return List.empty(growable: true);
    }
  }

  //   fetch new questions
  Future<List<QuestionEntity>> _fetchNewQuiz() async {

    final parameter = ref.watch(parameterProvider);
    try {

      listQuestion = await _initQuestionsData(parameter['amount'],
          parameter['idCategory'], parameter['difficulty'], parameter['type']);

      return listQuestion;
    } catch (e, stackTr) {
      return List.empty(growable: true);
    }
  }
}

final questionApiProvider = AsyncNotifierProvider.autoDispose<
    QuestionApiNotifier, List<QuestionEntity>>(() {
  return QuestionApiNotifier();
});
