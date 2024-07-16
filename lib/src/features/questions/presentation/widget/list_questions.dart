import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_async_notifier_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_item.dart';

class ListQuestions extends ConsumerWidget{
  const ListQuestions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncQuestion= ref.watch(asyncQuizProvider);
    final listQuestion = asyncQuestion.maybeMap(data: (asyncData) => asyncData.value,orElse: () => List<QuestionEntity>.empty());
   return  ListView.builder(
     itemCount: listQuestion.length,
       itemBuilder:(context, index) {
        return QuestionItem(questionEntity: listQuestion[index]);
       }
   );
  }

}