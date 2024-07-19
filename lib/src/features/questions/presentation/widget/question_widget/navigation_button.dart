import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/option_controller/parametter_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/identifier_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/result_controller/data_statistic_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/result_screen.dart';

import '../../controller/question_controller/question_controller.dart';

class NavigationButton extends ConsumerWidget{
  const NavigationButton({super.key,required this.questionEntity});
 final QuestionEntity questionEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final checkButton=ref.read(asyncQuestionProvider.notifier).checkButton();
    final parameter=ref.watch(parameterProvider);
    final mapAnswered=ref.watch(answerProvider);
    final answeredAll= mapAnswered.length == parameter['amount'];

   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 10),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [

         if(checkButton != 'not back')

            TextButton(
             onPressed:() {
               ref.read(asyncQuestionProvider.notifier).backQuestion();
               ref.read(asyncIdentifierProvider.notifier).updateIdentifier();
             },
             child: const Row(
               children: [
                 Icon(Icons.arrow_back,color: Colors.red,),
                 Text('Back',style: TextStyle(fontSize: 20,color: Colors.red),),
               ],
             )
            ),
            const SizedBox(width: 10,),

         if(checkButton != 'not next')

           TextButton(
             onPressed:() {
               ref.read(asyncQuestionProvider.notifier).nextQuestion();
               ref.read(asyncIdentifierProvider.notifier).updateIdentifier();

             },
             child: const Row(
               children: [
                 Text('Next',style: TextStyle(fontSize: 20,color: Colors.blue)),
                 Icon(Icons.arrow_forward,color: Colors.blue,),
               ],
             )
           ),
         if(checkButton == "not next")

           ElevatedButton(
             onPressed: () {
               if(answeredAll){
                 ref.read(asyncDataStatisticProvider.notifier).analysisQuiz();
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) =>  const ResultScreen() ),
                 );
               } else {
                 showDialog(
                     context: context,
                     builder: (ctx) => AlertDialog(
                       title: const Text('Answer all to submit!'),
                       content: const Text(
                           'You have not answered all the questions, please check again'),
                       actions: [
                         TextButton(
                             onPressed: () {
                               Navigator.pop(ctx);
                             },
                             child: const Text('Okay'))
                       ],
                     ));
               }
             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blueAccent,
               elevation: 10
             ),
             child: const Text('Submit',style: TextStyle(fontSize: 24,color: Colors.white)),
           )
       ],
     ),
   );
  }

}