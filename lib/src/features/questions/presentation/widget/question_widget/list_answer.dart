import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'answer_button.dart';

class ListAnswer extends ConsumerWidget{
  const ListAnswer({super.key,required this.listAnswer,required this.questionEntity});

  final List<String>? listAnswer;
  final QuestionEntity questionEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(listAnswer != null){
      final typeQuestion=listAnswer!.length;
        return Column(
        children: [
          const SizedBox(height: 1,),
          AnswerButton(answer: listAnswer![0] ,title: 'A',questionEntity: questionEntity,),
          AnswerButton(answer: listAnswer![1], title: 'B',questionEntity: questionEntity,),
          if(typeQuestion>2)
            AnswerButton(answer: listAnswer![2], title: 'C',questionEntity: questionEntity),
          if(typeQuestion>3)
            AnswerButton(answer: listAnswer![3], title: 'D',questionEntity: questionEntity),
        ],
      );

    } else {
      return const Center(child: Text('Data null . Please check'),);
    }

  }

}