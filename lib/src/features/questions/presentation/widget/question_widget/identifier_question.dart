import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/identifier_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';

class IdentifierQuestion extends ConsumerWidget {
  const IdentifierQuestion({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncIndex=ref.watch(asyncIdentifierProvider);
    final index=asyncIndex.maybeMap(data: (data) => data.value ,orElse: () => 0);
    final mapAnswered = ref.watch(answerProvider);
    final answered = mapAnswered.containsKey(id);

    return Container(
      decoration:  BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 3,color: answered ? Colors.blueAccent : Colors.grey.withOpacity(0.6)),
          )
      ),
      child: ElevatedButton(
        onPressed: () {

          ref.read(asyncQuestionProvider.notifier).clickIdentifier(id);
          ref.read(asyncIdentifierProvider.notifier).updateIdentifier();

        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            backgroundColor : answered ? ( id == index ? Colors.white : Colors.blueAccent ): ( id == index ? Colors.white  : Colors.white12 ),   //54
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
              color: answered ? ( id == index ? Colors.black : Colors.white ): Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}