import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/home_controller/category_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/list_question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';
import 'answer_controller.dart';


class QuestionNotifier extends AutoDisposeAsyncNotifier<QuestionEntity?> {

  int currentQuestionIndex=-1;
  List<QuestionEntity> listQuestion = List<QuestionEntity>.empty(growable: true);

  final _userRepository =UserRepository.create();
  final  _quizRepository = QuizRepository.create();

  @override
  FutureOr<QuestionEntity?> build() {
    return _initQuestion();
  }

  Future<QuestionEntity?> _initQuestion() async {
    try {
      final question = await ref.watch(listQuestionProvider.future);
      listQuestion =question;
      currentQuestionIndex = 0;
      final initQuestion = listQuestion.firstOrNull;
      return initQuestion;
    } catch (err, stackTr) {
      return Future.error(err, stackTr);
    }
  }

  // update question when next
  Future<void> nextQuestion() async {
    if (currentQuestionIndex < listQuestion.length) {
      final nextQuestion = listQuestion[++currentQuestionIndex];
      ref.read(currentIdSelectedProvider.notifier).state = nextQuestion.id;
      state = AsyncValue.data(nextQuestion);
    }
  }

  // update question when back
  Future<void> backQuestion() async {
    if (currentQuestionIndex > 0) {
      final backQuestion = listQuestion[--currentQuestionIndex];
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
      }
    }
    return true;
  }

  //  play again
  Future<void> playAgainQuiz() async {
    currentQuestionIndex=0;
    await _userRepository.subtractionCoin(3);
    for(final question in listQuestion){
      question.answerUser = null;
    }
    state=AsyncValue.data(listQuestion.first);
  }

//   User uses assistance
  Future<void> useAssistance(QuestionEntity questionEntity) async{

    final random =Random();
    //  update coin
    await _userRepository.subtractionCoin(1.0);
    while(questionEntity.shuffleAnswer!.length > 2){
      final index = random.nextInt(3);
      if(questionEntity.correctAnswer != questionEntity.shuffleAnswer![index]){
        questionEntity.shuffleAnswer!.removeAt(index);
      }
    }
   state=AsyncValue.data(questionEntity);
  }

// save or not question
 Future<void>  saveOrNotQuestion(QuestionEntity questionEntity) async{
    // final map =ref.read(questionApiProvider.notifier).getMap();
    final id =ref.watch(idCategoryProvider);
    final nameCategory=ref.watch(nameCategoryProvider);
    _quizRepository.toggleSaveQuestion(questionEntity,id,nameCategory);
 }

//   get list question
List<QuestionEntity> getQuestions() {
    return listQuestion;
}
}

final questionProvider =
    AsyncNotifierProvider.autoDispose<QuestionNotifier, QuestionEntity?>(() {
  return QuestionNotifier();
});
