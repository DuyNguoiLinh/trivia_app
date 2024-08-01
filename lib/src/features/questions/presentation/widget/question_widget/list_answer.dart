import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/list_question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';
import 'answer_button.dart';

class ListAnswer extends ConsumerWidget{
  const ListAnswer({super.key,required this.questionEntity});

  final QuestionEntity questionEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isSave =ref.watch(isSaveProvider(questionEntity.id));
     final indexTypeSource =ref.watch(typeSourceProvider);
    if(questionEntity.shuffleAnswer != null){
      return Column(
          children: [
            SizedBox(
              height: 330,
              child: ListView.builder(
                  itemCount: questionEntity.shuffleAnswer!.length,
                  itemBuilder: (context,index) {
                    return AnswerButton(answer: questionEntity.shuffleAnswer![index], index: index, questionEntity: questionEntity);
                  }
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if(questionEntity.shuffleAnswer!.length >2)
                TextButton(
                  onPressed: () {

                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Do you need 50:50 assistance?', style: TextStyle(fontSize: 16),),
                          content: RichText(
                            text: TextSpan(
                              style: const TextStyle(fontSize: 20, color: Colors.black),
                              children: [
                                const TextSpan(text: 'You need to pay  '),
                                const TextSpan(
                                  text: '1',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.red,
                                  ),
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Image.asset(
                                    'assets/images/bitcoin.png',
                                    width: 30,
                                    height: 40,
                                  ),
                                ),
                                const TextSpan(text: '  to 50:50'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  // play again
                                  Navigator.pop(context);

                                },
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  // use 50 : 50
                                  ref.read(questionProvider.notifier).useAssistance(questionEntity);
                                  // play again
                                  Navigator.pop(context);

                                },
                                child: const Text('Okay'))
                          ],
                        ));

                  },
                  child: const Text(
                    '50:50',
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                  ),
                ),

                if(questionEntity.shuffleAnswer!.length == 2)

                  const SizedBox(width: 50,),


                if(indexTypeSource == 0)

                IconButton(
                  color: Colors.red,
                    icon : SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/icons/save.png',color: isSave ? Colors.red :  Colors.black,),
                    ),

                  onPressed: () {
                      // save question or not
                      ref.read(questionProvider.notifier).saveOrNotQuestion(questionEntity);
                      ref.read(isSaveProvider(questionEntity.id).notifier).state=!isSave;
                  },
                ),
              ],
            )
          ],
      );
    } else {
      return const Center(child: Text('Data null . Please check'),);
    }

  }

}