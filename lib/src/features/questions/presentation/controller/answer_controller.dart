import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

final answerProvider =StateNotifierProvider<AnswerNotifier,Map<String,dynamic>>( (ref) {
  return AnswerNotifier();
});
class AnswerNotifier extends StateNotifier<Map<String,dynamic>> {
  final Map<String, dynamic> listAnswer = {};
  AnswerNotifier() : super({});
  void addAnswer(List<String> listAnswerRandom) {

  }

}