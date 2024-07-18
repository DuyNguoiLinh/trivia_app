import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/list_identifier.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/navigation_button.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/list_answer.dart';

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
                 const ListIdentifier(),
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                   child: Text(
                     questionCurrent.question,
                     style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                   ),
           ),
                 ListAnswer(listAnswer: questionCurrent.answers,id: questionCurrent.id,),
                 const Spacer(),
                 Expanded(child: NavigationButton(questionEntity: questionCurrent,)),
                 const SizedBox(height: 20,)
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