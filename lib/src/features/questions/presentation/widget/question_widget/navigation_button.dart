import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';

import '../../controller/question_controller.dart';

class NavigationButton extends ConsumerWidget{
  const NavigationButton({super.key,required this.questionEntity});
 final QuestionEntity questionEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkButton=ref.read(asyncQuestionProvider.notifier).checkButton();
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 10),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         if(checkButton != 'not back')
            TextButton(
             onPressed:() {
               ref.read(asyncQuestionProvider.notifier).backQuestion();
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