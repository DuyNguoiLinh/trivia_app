import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/question_item.dart';

import '../../domain/entity/question_entity.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key,required this.nameCategory});
  final String nameCategory;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Scaffold(
     appBar: AppBar(
       title: Container(
         margin: const EdgeInsets.only(left: 60),
           child: Text(nameCategory)),
     ),
     body:   const QuestionItem(),
   );
  }

}