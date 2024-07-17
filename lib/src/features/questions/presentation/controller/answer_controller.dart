import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller.dart';
// final answerProvider =AsyncNotifierProvider<AsyncAnswerNotifier,String>( () {
//   return AsyncAnswerNotifier();
// });
// class AsyncAnswerNotifier extends AsyncNotifier<String> {
//   @override
//   FutureOr<String> build() {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
//
// final answerProvider =StateNotifierProvider<AnswerNotifier,Map<String,dynamic>>( (ref) {
//   final asyncQuestion =ref.watch(asyncQuestionProvider);
//   // final question =asyncQuestion.maybeMap(data: (data) => data.value , orElse: ()  =>  );
//   return AnswerNotifier(questionEntity: question);
// });
// class AnswerNotifier extends StateNotifier<Map<String,dynamic>> {
//   final Map<String, dynamic> listAnswer = {};
//   AnswerNotifier({this.questionEntity}) : super({});
//   final QuestionEntity? questionEntity;
//   void addAnswer(List<String> listAnswerRandom) {
//
//   }
//
// }