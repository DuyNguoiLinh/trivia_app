import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'answer_button.dart';

class ListAnswer extends ConsumerWidget{
  const ListAnswer({super.key,required this.listAnswer,required this.id});
  final List<String>? listAnswer;
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(listAnswer != null){
      final int typeQuestion=listAnswer!.length;
        return Column(
        children: [
          const SizedBox(height: 1,),
          AnswerButton(answer: listAnswer![0] ,title: 'A',idKey: id,),
          AnswerButton(answer: listAnswer![1], title: 'B',idKey: id,),
          if(typeQuestion>2)
            AnswerButton(answer: listAnswer![2], title: 'C',idKey: id,),
          if(typeQuestion>3)
            AnswerButton(answer: listAnswer![3], title: 'D',idKey: id,),
        ],
      );

    } else {
      return const Center(child: Text('Data null . Please check'),);
    }

  }

}