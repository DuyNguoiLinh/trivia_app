import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/wallet_controller/list_category_favorite_controller.dart';

class QuestionLoveItem extends ConsumerWidget {
  const QuestionLoveItem({super.key, required this.questionEntity});

  final QuestionEntity questionEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isPick =ref.watch(isPickProvider(questionEntity.id));

    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: OutlinedButton(

        onPressed: () {

          ref.read(isPickProvider(questionEntity.id).notifier).state= !isPick;
          ref.read(listCategoryLoveProvider.notifier).pickQuestion(questionEntity);

        },

        style: OutlinedButton.styleFrom(
          backgroundColor: isPick ? Colors.blueAccent : Colors.white.withOpacity(1),
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: Colors.black,
          elevation: 16,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 130,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionEntity.question,
                style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: isPick ? Colors.white : Colors.black.withOpacity(0.8)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: questionEntity.shuffleAnswer!.length,
                  itemBuilder: (context, index) {
                    return Text('. ${questionEntity.shuffleAnswer![index]}',style: TextStyle(color: isPick ? Colors.white70 :Colors.black.withOpacity(0.6)),);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
final isPickProvider =StateProvider.family<bool,String>( (ref,id) => false);
