import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';

class AsyncDataStatisticNotifier extends AsyncNotifier<Map<String,String>> {
  final Map<String, String> listDataStatistic = {};

  @override
  FutureOr<Map<String,String>> build() {
    return _analysisQuiz();
  }
  // analysis Quiz include : completion , Total , Correct, Wrong
  Future<Map<String,String>>  _analysisQuiz() async{
    int correctCount = 0;
    final mapCorrectAnswer=ref.read(questionProvider.notifier).getCorrectAnswer();
     final mapUserAnswer =ref.watch(answerProvider);
     print(mapCorrectAnswer);
     print(mapUserAnswer);
     mapUserAnswer.forEach((key,value) {

       if(mapUserAnswer[key] == mapCorrectAnswer[key]){
         correctCount++;
       }

     });
     final int wrongCount = mapUserAnswer.length-correctCount;
     final int total = mapUserAnswer.length;
     final double completion = (correctCount/total)*100;
     final double coin=(correctCount/total)*10;
     // add data in map
     listDataStatistic['Correct']=correctCount.toString();
     listDataStatistic['Wrong']=wrongCount.toString();
     listDataStatistic['Total']=total.toString();
     listDataStatistic['Completion']=completion.toStringAsFixed(1);
     listDataStatistic['Coin']=coin.toStringAsFixed(1);
     state=AsyncValue.data({...listDataStatistic});
     return listDataStatistic;
  }
}

final asyncDataStatisticProvider = AsyncNotifierProvider<AsyncDataStatisticNotifier,Map<String,String>>(() {
  return AsyncDataStatisticNotifier();
});