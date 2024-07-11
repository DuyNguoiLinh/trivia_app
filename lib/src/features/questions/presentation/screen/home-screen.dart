import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_async_notifier_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/listQuestion.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/questionItem.dart';

class HomeScreen extends ConsumerWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncQuestions= ref.watch(asyncQuizProvider);
    final listQuestions = asyncQuestions.maybeMap(data: (asyncData) => asyncData.value,
          orElse: () => List<QuestionEntity>.empty(),);
   return Scaffold(
     appBar:  AppBar(
       title: const Text('List Question'),
     ),
     body: const ListQuestions()
   );
  }

}