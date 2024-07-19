import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_async_notifier_controller.dart';

class AsyncQuestionNotifier extends AsyncNotifier<QuestionEntity?> {
   int i=0;
   int index=0;
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
 Future<void> nextQuestion() async{
     if(i<listQuestion.length){
       state=AsyncValue.data(listQuestion[++i]);
     }
 }
   Future<void>  backQuestion() async {
     if(i>0){
       state=AsyncValue.data(listQuestion[--i]);
     }
   }
   Future<void> clickIdentifier(int id) async{
     state=AsyncValue.data(listQuestion[--id]);
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
   Map<int,String> getCorrectAnswer() {
     final Map<int, String> listCorrectAnswer = {};
     for(final question in listQuestion){
       listCorrectAnswer[question.id]=question.correctAnswer;
     }
     return listCorrectAnswer;
   }
}
final asyncQuestionProvider = AsyncNotifierProvider<AsyncQuestionNotifier,QuestionEntity?>(() {
  return AsyncQuestionNotifier();
});