import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/parametter_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/identifier_question.dart';

import '../../controller/answer_controller.dart';

class ListIdentifier extends ConsumerWidget {
  const ListIdentifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapParameter=ref.watch(parameterProvider);
    final amount = mapParameter['amount'];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueGrey.withOpacity(0.1),
      // Màu nền của Container
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          if(amount == 5){
            return Column(
              children: [
                  IdentifierQuestion(id: ++index,),
                   const SizedBox(height: 10,)
              ],
            );
          } else {
            return Column(
              children: [
                IdentifierQuestion(id: ++index,),
                const SizedBox(height: 5,),
                IdentifierQuestion(id: index+=5),
                const SizedBox(height: 5,),
              ],
            );
          }
  },
      ),
      ),
    );
  }
}