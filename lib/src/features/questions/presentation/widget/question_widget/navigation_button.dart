import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/submit_button.dart';
import '../../controller/question_controller/question_controller.dart';

class NavigationButton extends ConsumerWidget{
  const NavigationButton({super.key,required this.questionEntity});
 final QuestionEntity questionEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // check answered all or not
    final answeredAll= ref.read(questionProvider.notifier).checkAnsweredAll();
      // check show back or next
    final checkButton=ref.read(questionProvider.notifier).checkButton();

   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 10),
     child: Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [

             if(checkButton != 'notBack')

                TextButton(
                 onPressed:() {
                   ref.read(questionProvider.notifier).backQuestion();
                   // ref.read(asyncIdentifierProvider.notifier).updateIdentifier();
                 },
                 child: const Row(
                   children: [
                     Icon(Icons.arrow_back,color: Colors.red,),
                     Text('Back',style: TextStyle(fontSize: 20,color: Colors.red),),
                   ],
                 )
                ),
                const SizedBox(width: 10,),

             if(checkButton != 'notNext')

               TextButton(
                 onPressed:() {
                   ref.read(questionProvider.notifier).nextQuestion();
                   // ref.read(asyncIdentifierProvider.notifier).updateIdentifier();

                 },
                 child: const Row(
                   children: [
                     Text('Next',style: TextStyle(fontSize: 20,color: Colors.blue)),
                     Icon(Icons.arrow_forward,color: Colors.blue,),
                   ],
                 )
               ),
             if(checkButton == "notNext" )
               SubmitButton(answeredAll: answeredAll),
           ],
         ),
         if(answeredAll && checkButton != 'notNext')
           Center(
              child: SubmitButton(answeredAll: answeredAll),
           ),
       ],
     ),
   );
  }

}