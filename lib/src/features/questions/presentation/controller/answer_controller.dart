import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller.dart';

final answerProvider =
StateNotifierProvider<AnswerNotifier, Map<String, String>>((ref) {
  return AnswerNotifier();
});

class AnswerNotifier extends StateNotifier<Map<String, String>> {
  AnswerNotifier() : super({});
  final Map<String, String> listAnswer = {};

  // Use map
  void addAnswer(String key, String value) {
    listAnswer[key] = value;
    state = {...listAnswer};
    print(listAnswer);
  }
  void clearAnswerInMap() {
    listAnswer.clear();
    state={...listAnswer};
  }

}