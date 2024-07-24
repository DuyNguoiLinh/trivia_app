import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/identifier_question.dart';

class AsyncQuestionNotifier extends AsyncNotifier<QuestionEntity?> {
  late int i;
  List<QuestionEntity> listQuestion = List<QuestionEntity>.empty(growable: true);
  @override
  FutureOr<QuestionEntity?> build() {
    return _initQuestion();
  }

  Future<QuestionEntity?> _initQuestion() async {
    try {
      listQuestion = await ref.watch(quizProvider.future);
      i = 0;
      final initQuestion = listQuestion.firstOrNull;
      return initQuestion;
    } catch (err, stackTr) {
      return Future.error(err, stackTr);
    }
  }

  // update question when next
  Future<void> nextQuestion() async {
    if (i < listQuestion.length) {
      final nextQuestion = listQuestion[++i];
      ref.read(currentIdSelectedProvider.notifier).state = nextQuestion.id;
      state = AsyncValue.data(nextQuestion);
    }
  }

  // update question when back
  Future<void> backQuestion() async {
    if (i > 0) {
      final backQuestion = listQuestion[--i];
      ref.read(currentIdSelectedProvider.notifier).state = backQuestion.id;
      state = AsyncValue.data(backQuestion);
    }
  }

  //  update question by click identifier
  Future<void> updateQuestionByIdentifier(String id) async {
    for (final question in listQuestion) {
      if (question.id == id) {
        state = AsyncValue.data(question);
        break;
      }
    }
  }

  // add answerUser
  Future<void> addAnsweredUser(String answer) async {
    final questionCurrent = state.value;

    if (questionCurrent == null) return;

    if (questionCurrent.answerUser != null &&
        questionCurrent.answerUser == answer) {
      questionCurrent.answerUser = null;
    } else {
      questionCurrent.answerUser = answer;
    }
    state = AsyncValue.data(questionCurrent);
  }

  // check button next or back or submit
  String checkButton() {
    for (int index = 0; index < listQuestion.length; index++) {
      if (listQuestion[index] == state.value) {
        if (index == 0) {
          return 'notBack';
        }
        if (index == listQuestion.length - 1) {
          return 'notNext';
        }
      }
    }
    return 'submit';
  }

  //  check answered all or not
  bool checkAnsweredAll() {
    for (final question in listQuestion) {
      if (question.answerUser == null) {
        return false;
        break;
      }
    }
    return true;
  }
  //  play again
  Future<void> playAgainQuiz() async {
    i=0;
    for(final question in listQuestion){
      question.answerUser = null;
    }
    state=AsyncValue.data(listQuestion.first);
  }

  // get listQuestion
  List<QuestionEntity> getListQuestion() {
    return listQuestion;
  }
}

final questionProvider =
    AsyncNotifierProvider<AsyncQuestionNotifier, QuestionEntity?>(() {
  return AsyncQuestionNotifier();
});
