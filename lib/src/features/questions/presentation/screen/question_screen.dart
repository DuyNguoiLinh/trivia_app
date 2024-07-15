import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/list_questions.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("\$Name Category "),
     ),
     body:  const ListQuestions(),
   );
  }

}