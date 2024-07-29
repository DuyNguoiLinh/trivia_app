import 'dart:math';
import 'package:uuid/uuid.dart';
import '../../data/models/remote/question_model.dart';

const uuid = Uuid();

class QuestionEntity {
  final String id;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  List<String>? shuffleAnswer;
  String? answerUser;

  QuestionEntity(
      {required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers,
      this.answerUser})
      : id = uuid.v4();

  factory QuestionEntity.fromQuestionModel(QuestionModel questionModel) {
    return QuestionEntity(
        question: questionModel.question,
        correctAnswer: questionModel.correctAnswer,
        incorrectAnswers: questionModel.incorrectAnswers
    ) ;
  }

  List<String>? get answers {
    if (shuffleAnswer == null) {
      final List<String> listRandom = [...incorrectAnswers, correctAnswer];
      shuffleAnswer = List.from(listRandom)..shuffle();
    }
    return shuffleAnswer;
  }
}
