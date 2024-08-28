import 'package:trivia_app_with_flutter/src/features/questions/data/models/local/question_local.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/remote/question_model.dart';

const uuid = Uuid();

class QuestionEntity {
  final String id;
  final int? idCategory;
  final String? nameCategory;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final List<String>? shuffleAnswer;
  String? answerUser;

  QuestionEntity(
      {required this.id,
        this.idCategory,
        this.nameCategory,
      required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers,
      this.shuffleAnswer,
      this.answerUser});

  factory QuestionEntity.fromQuestionModel(QuestionModel questionModel) {
    final List<String> listRandom = [...questionModel.incorrectAnswers, questionModel.correctAnswer];
    listRandom.shuffle();

    return QuestionEntity(
        id: uuid.v4(),
        question: questionModel.question,
        correctAnswer: questionModel.correctAnswer,
        incorrectAnswers: questionModel.incorrectAnswers,
        shuffleAnswer: listRandom
    );
  }

  factory QuestionEntity.fromQuestionLocal(QuestionLocal questionLocal) {
    return QuestionEntity(
      id: questionLocal.idQuestion,
      idCategory: questionLocal.idCategory,
      question: questionLocal.question,
      correctAnswer: questionLocal.correctAnswer,
      incorrectAnswers: questionLocal.incorrectAnswers,
      shuffleAnswer: questionLocal.shuffleAnswer,
    );
  }


}
