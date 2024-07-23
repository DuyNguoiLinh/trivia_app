import 'package:json_annotation/json_annotation.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/remote_models/question_model.dart';
part 'questions_response.g.dart';
@JsonSerializable()
class QuestionsResponse{
  @JsonKey(name: 'response_code')
  final int responseCode;
  final List<QuestionModel> results;

  QuestionsResponse({required this.responseCode, required this.results});

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) => _$QuestionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}