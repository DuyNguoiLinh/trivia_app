import 'package:isar/isar.dart';

import '../../../../user/data/model/firebase_model/question_firestore_model.dart';

part 'question_local.g.dart';
@Collection()
class QuestionLocal {
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  late String idQuestion;
  late int idCategory;
  late String nameCategory;
  late String question;
  late String correctAnswer;
  late List<String> incorrectAnswers;
  late List<String> shuffleAnswer;

  QuestionLocal({
    required this.idQuestion,
    required this.idCategory,
    required this.nameCategory,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.shuffleAnswer
  });

  factory QuestionLocal.fromQuestionFirestore(QuestionFirestoreModel questionFirestore) {
    return QuestionLocal(
      idQuestion: questionFirestore.id,
      idCategory: questionFirestore.idCategory,
      nameCategory: questionFirestore.nameCategory,
      question: questionFirestore.question,
      correctAnswer: questionFirestore.correctAnswer,
      incorrectAnswers: questionFirestore.incorrectAnswers,
      shuffleAnswer: questionFirestore.shuffleAnswer,
    );
  }

}
