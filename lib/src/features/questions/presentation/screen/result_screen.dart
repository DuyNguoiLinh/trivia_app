import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/result_widget/details_result.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/result_widget/list_action.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return  const Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           DetailsResult(),
           SizedBox(height: 10,),
           Expanded(child: ListAction()),
         ],
       ),
     );
  }

}