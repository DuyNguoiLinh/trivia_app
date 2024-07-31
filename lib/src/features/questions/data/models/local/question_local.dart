import 'package:isar/isar.dart';

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

  QuestionLocal({
    required this.idQuestion,
    required this.idCategory,
    required this.nameCategory,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });
}
