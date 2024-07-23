import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';

class IdentifierQuestion extends ConsumerWidget {
  const IdentifierQuestion({super.key, required this.id,required this.questionCurrent});

  final QuestionEntity questionCurrent;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Is question current
    final currentIdSelected = ref.watch(currentIdSelectedProvider);
    final isQuestionCurrent= currentIdSelected  == questionCurrent.id;
    print(isQuestionCurrent);
    //  answered or no
    final mapAnswered = ref.watch(answerProvider);
    final answered = mapAnswered.containsKey(questionCurrent.id);


    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      decoration:  BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 3,color: answered ? Colors.blueAccent : Colors.grey.withOpacity(0.6)),
          )
      ),
      child: ElevatedButton(
        onPressed: () {

          ref.read(currentIdSelectedProvider.notifier).state = questionCurrent.id;
          ref.read(questionProvider.notifier).getQuestionByIdentifier(questionCurrent.id);

        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            backgroundColor : answered ? ( isQuestionCurrent  ? Colors.white : Colors.blueAccent ): ( isQuestionCurrent  ? Colors.white  : Colors.white12 ),   //54
            side: const BorderSide(color: Colors.black38, width: 2)
        ),
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          child: Text(
            id.toString(),
            style: TextStyle(
              fontSize: 14,
              color: answered ? ( isQuestionCurrent ? Colors.black : Colors.white ): Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

final currentIdSelectedProvider = StateProvider<String>((ref) => "");