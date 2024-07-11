import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/questionItem.dart';

import '../../domain/entity/question_entity.dart';
import '../controller/quiz_async_notifier_controller.dart';

class ListQuestions extends ConsumerWidget {
  const ListQuestions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncQuestions= ref.watch(asyncQuizProvider);
    final listQuestions = asyncQuestions.maybeMap(data: (asyncData) => asyncData.value,
      orElse: () => List<QuestionEntity>.empty(),);
    return ListView.builder(
        itemCount: listQuestions.length,
        itemBuilder: (context,index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: QuestionItem(questionEntity: listQuestions[index] ),
          );

        }
    );
  }

}