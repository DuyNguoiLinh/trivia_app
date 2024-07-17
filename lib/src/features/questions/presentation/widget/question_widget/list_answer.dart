import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/answer_controller.dart';

import 'answer_button.dart';

class ListAnswer extends ConsumerWidget{
  const ListAnswer({super.key,required this.listAnswer});
  final List<String>? listAnswer;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(listAnswer != null){
      final int typeQuestion=listAnswer!.length;
      return Column(
        children: [
          const SizedBox(height: 1,),
          AnswerButton(answer: listAnswer![0] ,title: 'A',),
          AnswerButton(answer: listAnswer![1], title: 'B',),
          if(typeQuestion>2)
            AnswerButton(answer: listAnswer![2], title: 'C',),
          if(typeQuestion>3)
            AnswerButton(answer: listAnswer![3], title: 'D',),

          // ...listAnswer!.map((e) => AnswerButton(answer: e))
          // ...questionCurrent.getShuffledAnswers().map((e) => AnswerButton(answer: e)),
        ],
      );
    } else {
      return const Center(child: Text('Data null . Please check'),);
    }

  }

}