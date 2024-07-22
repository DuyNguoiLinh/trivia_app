import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/review_widget/question_identifier.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/review_widget/summary_item.dart';

class QuestionsSummary extends ConsumerWidget{
  const QuestionsSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
       final listQuestion=ref.read(asyncQuestionProvider.notifier).getListQuestion();
       final mapAnswered =ref.watch(answerProvider);
    return ListView.builder(
      itemCount: listQuestion.length,
        itemBuilder: (context,index) {
             return  SummaryItem(questionEntity: listQuestion[index],userAnswered: mapAnswered[index+1]!,);
        }
    );
  }

}