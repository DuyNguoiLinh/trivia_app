import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/answer_controller.dart';

import 'answer_button.dart';

class ListAnswer extends ConsumerWidget{
  const ListAnswer({super.key,required this.listAnswer,required this.correctAnswer,required this.question});
  final List<String>? listAnswer;
  final String correctAnswer;
  final String question;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(listAnswer != null){
      final int typeQuestion=listAnswer!.length;
      if(typeQuestion>2) {
        return Column(
        children: [
          const SizedBox(height: 1,),
          AnswerButton(answer: listAnswer![0] ,title: 'A',correctKey: correctAnswer,),
          AnswerButton(answer: listAnswer![1], title: 'B',correctKey: correctAnswer,),
          AnswerButton(answer: listAnswer![2], title: 'C',correctKey: correctAnswer),
          AnswerButton(answer: listAnswer![3], title: 'D',correctKey: correctAnswer),
        ],
      );
      } else {
        return Column(
          children: [
            const SizedBox(height: 1,),
            AnswerButton(answer: listAnswer![0] ,title: 'A',correctKey: question,),
            AnswerButton(answer: listAnswer![1], title: 'B',correctKey: question,),
          ],
        );
      }
    } else {
      return const Center(child: Text('Data null . Please check'),);
    }

  }

}