import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/list_identifier.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/navigation_button.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/list_answer.dart';

class QuestionView extends ConsumerWidget{
  const QuestionView({super.key,});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncQuestion=ref.watch(questionProvider);

     return asyncQuestion.when(
         data: (questionCurrent) {
           if(questionCurrent != null) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                    const ListIdentifier(),
                   // const SizedBox(height: 30,),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                     child: Text(
                       questionCurrent.question,
                       style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                     ),
                           ),
                   ListAnswer(questionEntity: questionCurrent,),
                   NavigationButton(questionEntity: questionCurrent,),

                 ],
                             ),
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