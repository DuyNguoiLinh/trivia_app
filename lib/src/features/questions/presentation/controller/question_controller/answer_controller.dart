import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';

final answerProvider =
StateNotifierProvider<AnswerNotifier, Map<String, String>>((ref) {
  return AnswerNotifier();
});

class AnswerNotifier extends StateNotifier<Map<String, String>> {
  AnswerNotifier() : super({});
  final Map<String, String> listAnswer = {};

  // Use map
  void addAnswer(String key, String value) {
    if(listAnswer[key] == value){
      listAnswer.remove(key);
      state={...listAnswer};
    } else{
      listAnswer[key] = value;
      state = {...listAnswer};
      print(listAnswer);
    }
  }
  //  clear All Map
  void clearAnswerInMap() {
    listAnswer.clear();
    state={...listAnswer};
  }

}