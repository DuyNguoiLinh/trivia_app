import 'package:json_annotation/json_annotation.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
part 'question_firestore_model.g.dart';

@JsonSerializable()
class QuestionFirestoreModel {
  final String id;
  final int idCategory;
  final String nameCategory;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final List<String> shuffleAnswer;
  String? answerUser;

  QuestionFirestoreModel({
    required this.id,
    required this.idCategory,
    required this.nameCategory,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.shuffleAnswer,
    this.answerUser,
  });



  factory QuestionFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionFirestoreModelFromJson(json);


  Map<String, dynamic> toJson() => _$QuestionFirestoreModelToJson(this);
}
