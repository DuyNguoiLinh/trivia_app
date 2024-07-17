import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/parametter_controller.dart';

class AnswerButton extends ConsumerWidget {
  const AnswerButton({super.key, required this.answer});
  final String answer;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answerCurrent=ref.watch(answerProvider);
    // final isPickAnswer = (answerCurrent == answer);
    // final mapOptions=ref.watch(parameterProvider);
    // final isPickOption= (mapOptions[typeOption] == nameOption);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const SizedBox(width: 15,),
          Expanded(
            child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // backgroundColor: isPickAnswer ? Colors.blueAccent : Colors.white,
                    // foregroundColor: isPickAnswer ? Colors.white.withOpacity(0.8) : Colors.blueAccent.withOpacity(0.8),
                    side: const BorderSide(width: 2.0,color: Colors.blueAccent),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // ref.read(answerProvider.notifier).addUserAnswer(answer);
                  },
                  child:  Row(
                    children: [
                      const SizedBox(width: 50,),
                      Text(answer, style: const TextStyle(fontSize: 20),),
                    ],
                  ),
            ),
          ),
          const SizedBox(width: 15,),
        ],
      ),
    );


  }

}