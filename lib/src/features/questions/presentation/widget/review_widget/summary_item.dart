import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/review_widget/question_identifier.dart';

class SummaryItem extends ConsumerWidget{
  const SummaryItem({super.key,required this.questionEntity,required this.index});
 final QuestionEntity  questionEntity;
 final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTrue = questionEntity.correctAnswer == questionEntity.answerUser;
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 10,),
          QuestionIdentifier(isTrue: isTrue,index: index,),
          const SizedBox(width: 30,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( questionEntity.question,
                    style:  TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text( questionEntity.correctAnswer,
                      style: const TextStyle(
                        fontSize: 22,
                          color: Color.fromARGB(255, 181, 254, 246)
                      )),
                  Text( questionEntity.answerUser!,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 202, 171, 252),                      )),
                ],
              ))
        ],
      ),
    );
  }

}