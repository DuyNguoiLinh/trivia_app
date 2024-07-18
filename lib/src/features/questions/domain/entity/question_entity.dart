import 'dart:math';

import 'package:trivia_app_with_flutter/src/features/questions/data/models/question_model.dart';

class QuestionEntity{
  static int _idCounter = 1;
  final int id;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  List<String>? shuffleAnswer;
  QuestionEntity({required this.id,required this.question, required this.correctAnswer,required this.incorrectAnswers});
  factory QuestionEntity.fromQuestionModel(QuestionModel questionModel) {
    return QuestionEntity(
        id: _idCounter++,
        question: questionModel.question,
        correctAnswer: questionModel.correctAnswer,
        incorrectAnswers: questionModel.incorrectAnswers);
  }
  List<String>?  get answers{
    if(shuffleAnswer == null){
      final List<String> listRandom= [...incorrectAnswers,correctAnswer];
      shuffleAnswer=List.from(listRandom)..shuffle();
    }
    return shuffleAnswer;
  }
  static void resetIdCounter() {
    _idCounter = 1;
  }
}