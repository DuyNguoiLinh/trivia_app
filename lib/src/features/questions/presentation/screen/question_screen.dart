import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/list_questions.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key,required this.nameCategory});
  final String nameCategory;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Scaffold(
     appBar: AppBar(
       title: Container(
         padding: const EdgeInsets.only(left: 80),
           child: Text(nameCategory)),
     ),
     body:  const ListQuestions(),
   );
  }

}