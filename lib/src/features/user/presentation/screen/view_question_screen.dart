import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/list_question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/wallet_controller/list_category_favorite_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/view_question_widget/question_love_item.dart';
import '../../../questions/domain/entity/question_entity.dart';
import '../../../questions/presentation/controller/home_controller/category_controller.dart';
import '../../../questions/presentation/screen/question_screen.dart';

class ViewQuestionScreen extends ConsumerWidget {
  const ViewQuestionScreen({super.key, required this.listQuestion});

  final List<QuestionEntity> listQuestion;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // id category user pick
    final idCategory =ref.watch(idCategoryProvider);
    //  amount question pick
    final amountPick =ref.watch(amountPickProvider);

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

                          ref.read(listCategoryLoveProvider.notifier).deleteAllQuestion(idCategory);
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

                      ref.read(listCategoryLoveProvider.notifier).deleteQuestion(listQuestion[index].id,idCategory);

                    },
                    child: QuestionLoveItem(questionEntity: listQuestion[index])
                );
              }
            ),
          ),
          TextButton(
            onPressed: () {
              if(amountPick >= 5){
                ref.read(typeSourceProvider.notifier).state=1;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  const QuestionScreen()),
                );
              }

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
              child: Column(
                children: [
                  Text('Please ! choose more than 5 question',style:  TextStyle(color: Colors.black),),
                  Text(
                    'Practice Now!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        //
        ],
      ),
    );
  }
}
final amountPickProvider =StateProvider.autoDispose<int>((ref) => 0);