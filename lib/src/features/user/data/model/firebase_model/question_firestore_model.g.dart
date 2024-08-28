// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionFirestoreModel _$QuestionFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    QuestionFirestoreModel(
      id: json['id'] as String,
      idCategory: (json['idCategory'] as num).toInt(),
      nameCategory: json['nameCategory'] as String,
      question: json['question'] as String,
      correctAnswer: json['correctAnswer'] as String,
      incorrectAnswers: (json['incorrectAnswers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      shuffleAnswer: (json['shuffleAnswer'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answerUser: json['answerUser'] as String?,
    );

Map<String, dynamic> _$QuestionFirestoreModelToJson(
        QuestionFirestoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCategory': instance.idCategory,
      'nameCategory': instance.nameCategory,
      'question': instance.question,
      'correctAnswer': instance.correctAnswer,
      'incorrectAnswers': instance.incorrectAnswers,
      'shuffleAnswer': instance.shuffleAnswer,
      'answerUser': instance.answerUser,
    };
