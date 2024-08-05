import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/list_question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/review_widget/summary_item.dart';

class QuestionsSummary extends ConsumerWidget {
  const QuestionsSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncListQuestion = ref.watch(listQuestionProvider);

    final listQuestion = asyncListQuestion.maybeMap(
        data: (list) => list.value,
        orElse: () => List<QuestionEntity>.empty(growable: true));

    return ListView.builder(
        itemCount: listQuestion.length,
        itemBuilder: (context, index) {
          return SummaryItem(
            questionEntity: listQuestion[index],
            index: index + 1,
          );
        });
  }
}
