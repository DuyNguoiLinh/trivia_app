import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/navigation_button.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/list_answer.dart';

import '../../../domain/entity/question_entity.dart';

class QuestionItem extends ConsumerWidget{
  const QuestionItem({super.key,});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncQuestion=ref.watch(asyncQuestionProvider);
     return asyncQuestion.when(
         data: (questionCurrent) {
           if(questionCurrent != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 const SizedBox(height: 50,),
                 Container(
                     padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                   child: Text(
                     questionCurrent.question,
                     style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                   ),
           ),
                 ListAnswer(listAnswer: questionCurrent.answers,correctAnswer: questionCurrent.correctAnswer,question: questionCurrent.question,),
                 const SizedBox(height: 20,),
                 NavigationButton(questionEntity: questionCurrent,),
               ],
             );
           } else {
             return const Center(child: Text('Data null'),);
           }
         },
         error: (err, stack) => Center(child: Text('Error: $err')),
         loading:() => const Center(child: CircularProgressIndicator()),
     );
  }

}