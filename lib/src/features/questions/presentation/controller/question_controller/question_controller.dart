import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_async_notifier_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/identifier_question.dart';

class AsyncQuestionNotifier extends AsyncNotifier<QuestionEntity?> {
   late int i;
   List<QuestionEntity> listQuestion=List<QuestionEntity>.empty(growable: true);
   @override
  FutureOr<QuestionEntity?> build() {
   return _initQuestion();
  }

 Future<QuestionEntity?> _initQuestion() async{
    try{
      listQuestion = await ref.watch(asyncQuizProvider.future);
      i=0;
      final initQuestion =listQuestion.firstOrNull;
      return initQuestion;
    } catch(err,stackTr){
      return Future.error(err,stackTr);
    }
 }

 Future<void> nextQuestion() async{
     if(i<listQuestion.length){
       final nextQuestion =listQuestion[++i];
       ref.read(currentIdSelectedProvider.notifier).state = nextQuestion.id;
       state=AsyncValue.data(nextQuestion);
     }
 }

   Future<void>  backQuestion() async {
     if(i>0){
       final backQuestion=listQuestion[--i];
       ref.read(currentIdSelectedProvider.notifier).state = backQuestion.id;
       state=AsyncValue.data(backQuestion);
     }
   }

   Future<void> getQuestionByIdentifier(String id) async{
      for(final question in listQuestion){
        if(question.id == id) {
          state=AsyncValue.data(question);
          break;
        }
      }
   }

   Future<void>  addAnsweredUser(String answer) async{
     final questionCurrent=state.value;
     if(questionCurrent?.answerUser != null && questionCurrent?.answerUser == answer) {
       questionCurrent?.answerUser = null;
     } else {
       questionCurrent?.answerUser = answer;
     }
     state=AsyncValue.data(questionCurrent);
   }

   String  checkButton() {
     for( int index=0; index<listQuestion.length;index++){
       if(listQuestion[index] == state.value){
         if(index==0) {
           return 'notBack';
         }
         if(index==listQuestion.length-1){
           return 'notNext';
         }
       }
     }
     return 'submit';
   }

   //  check answered all or not
   bool checkAnsweredAll() {
     for(final question in listQuestion){
       if(question.answerUser == null) {
         return false;
         break;
       }
     }
     return true;
   }

   List<QuestionEntity> getListQuestion() {
    return listQuestion;
   }

}
final questionProvider = AsyncNotifierProvider<AsyncQuestionNotifier,QuestionEntity?>(() {
  return AsyncQuestionNotifier();
});