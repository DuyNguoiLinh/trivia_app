import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_async_notifier_controller.dart';

class AsyncQuestionNotifier extends AsyncNotifier<QuestionEntity?> {
   int i=0;
   List<QuestionEntity> listQuestion=List<QuestionEntity>.empty(growable: true);
  @override
  FutureOr<QuestionEntity?> build() {
   return _initQuestion();
  }
 Future<QuestionEntity?> _initQuestion() async{
    try{
        listQuestion = await ref.watch(asyncQuizProvider.future);
        return listQuestion.firstOrNull;
    } catch(err,stackTr){
      return Future.error(err,stackTr);
    }
 }
 Future<void> nextQuestion() async {
     if(i<listQuestion.length){
       state=AsyncValue.data(listQuestion[++i]);
     }
 }
   Future<void> backQuestion() async {
     if(i>0){
       state=AsyncValue.data(listQuestion[--i]);
     }
   }
   String  checkButton() {
     for( int index=0; index<listQuestion.length;index++){
       if(listQuestion[index] == state.value){
         if(index==0) {
           return 'not back';
         }
         if(index==listQuestion.length-1){
           return 'not next';
         }
       }
     }
     return 'submit';
   }
}
final asyncQuestionProvider = AsyncNotifierProvider<AsyncQuestionNotifier,QuestionEntity?>(() {
  return AsyncQuestionNotifier();
});