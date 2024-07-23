import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/option_controller/parametter_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_async_notifier_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/identifier_question.dart';

import '../../controller/question_controller/answer_controller.dart';

class ListIdentifier extends ConsumerWidget {
  const ListIdentifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(asyncQuizProvider).valueOrNull ?? List.empty();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueGrey.withOpacity(0.1),
        // Màu nền của Container
      ),
      height: 60,
      child: ListView.builder(
        itemCount: questions.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return IdentifierQuestion(
            id: index + 1,
            questionCurrent: questions[index],
          );
        },
      ),
    //   // child: Row(
    //   //   mainAxisAlignment: MainAxisAlignment.center,
    //   //   children: List.generate(
    //   //     5,
    //   //     (index) {
    //   //       if (amount == 5) {
    //   //         return Column(
    //   //           children: [
    //   //             IdentifierQuestion(
    //   //               id: ++index,
    //   //               questionCurrent: questionCurrent,
    //   //             ),
    //   //             const SizedBox(
    //   //               height: 10,
    //   //             )
    //   //           ],
    //   //         );
    //   //       } else {
    //   //         return Column(
    //   //           children: [
    //   //             IdentifierQuestion(
    //   //               id: ++index,
    //   //               questionCurrent: questionCurrent,
    //   //             ),
    //   //             const SizedBox(
    //   //               height: 5,
    //   //             ),
    //   //             IdentifierQuestion(
    //   //               id: index += 5,
    //   //               questionCurrent: questionCurrent,
    //   //             ),
    //   //             const SizedBox(
    //   //               height: 5,
    //   //             ),
    //   //           ],
    //   //         );
    //   //       }
    //   //     },
    //   //   ),
    //   // ),
    );
  }
}
