import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/view_question_widget/question_love_item.dart';
import '../../../questions/domain/entity/question_entity.dart';

class ViewQuestionScreen extends ConsumerWidget {
  const ViewQuestionScreen({super.key, required this.listQuestion});

  final List<QuestionEntity> listQuestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: const Text('Favorite Question')),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('You want to delete all'),
                    actions: [
                      TextButton(
                        child: const Text(
                          'Cancel',
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueAccent),
                        ),
                        onPressed: () {
                          //
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Delete All',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: listQuestion.length,
              itemBuilder: (context,index) {
               return  Dismissible(
                    key: ValueKey(listQuestion[index].id),
                    background: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.red,
                      child: const Row(
                        children: [
                          Spacer(),
                          Icon(Icons.delete,)
                        ],
                      ),
                    ),
                    onDismissed: (direction) {
                    },
                    child: QuestionLoveItem(questionEntity: listQuestion[index])
                );
                // return QuestionLoveItem(questionEntity: listQuestion[index]);
              }
            ),
          ),
          TextButton(
            onPressed: () {

            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            child: const Center(
              child: Text(
                'Practice Now!',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        //
        ],
      ),
    );
  }
}
