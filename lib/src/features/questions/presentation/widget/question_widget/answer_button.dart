import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/parametter_controller.dart';

class AnswerButton extends ConsumerWidget {
  const AnswerButton({super.key, required this.answer,required this.title,required this.correctKey});
  final String answer;
  final String title;
  final String correctKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answerCurrent=ref.watch(answerProvider);
    final isPickAnswer = (answerCurrent[correctKey] == answer);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const SizedBox(width: 15,),
          Expanded(
            child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: isPickAnswer ? Colors.blueAccent : Colors.white,
                    foregroundColor: isPickAnswer ? Colors.white : Colors.blueAccent.withOpacity(0.8),
                    side: BorderSide(
                      color: isPickAnswer ? Colors.redAccent : Colors.blueAccent,
                      width: 2.0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    ref.read(answerProvider.notifier).addAnswer(correctKey,answer);
                  },
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(title,
                            style:  TextStyle(fontSize: 20,color: isPickAnswer ? Colors.white : Colors.deepOrange)),
                        const SizedBox(width: 50,),
                        Text(answer, style: const TextStyle(fontSize: 20),maxLines: null, overflow: TextOverflow.visible,),
                      ],
                    ),
                  ),
            ),
          ),
          const SizedBox(width: 15,),
        ],
      ),
    );


  }

}