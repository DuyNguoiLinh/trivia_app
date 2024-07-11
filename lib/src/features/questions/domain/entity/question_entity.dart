import 'package:trivia_app_with_flutter/src/features/questions/data/models/question_model.dart';

class QuestionEntity{
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  QuestionEntity({required this.question, required this.correctAnswer,required this.incorrectAnswers});
  factory QuestionEntity.fromQuestionModel(QuestionModel questionModel) {
    return QuestionEntity(
        question: questionModel.question,
        correctAnswer: questionModel.correctAnswer,
        incorrectAnswers: questionModel.incorrectAnswers);
  }
}