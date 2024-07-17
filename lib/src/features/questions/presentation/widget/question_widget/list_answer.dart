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
    return Column(
      children: [
        const SizedBox(height: 1,),
        ...listAnswer!.map((e) => AnswerButton(answer: e))
        // ...questionCurrent.getShuffledAnswers().map((e) => AnswerButton(answer: e)),
      ],
    );
  }

}