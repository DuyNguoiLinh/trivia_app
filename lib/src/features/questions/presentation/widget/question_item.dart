import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';

class QuestionItem extends ConsumerWidget{
  const QuestionItem({super.key, required this.questionEntity});
 final QuestionEntity questionEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return Column(
       children: [
         Text(questionEntity.question.toString()),
         Text(questionEntity.correctAnswer.toString()),
         Text(questionEntity.incorrectAnswers[0].toString()),
       ],
     );
  }

}