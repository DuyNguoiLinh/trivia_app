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
      return SizedBox(
        height: 400,
        child: ListView.builder(
          itemCount: listAnswer!.length,
          itemBuilder: (context,index) {
            return AnswerButton(answer: listAnswer![index], index: index, questionEntity: questionEntity);
          }
        ),
      );
    } else {
      return const Center(child: Text('Data null . Please check'),);
    }

  }

}