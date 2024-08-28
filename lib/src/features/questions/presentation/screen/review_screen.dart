import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/review_widget/questions_summary.dart';

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.limeAccent,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text('Review',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold ,color: Colors.white),),
        ),
      ),
      body: SizedBox(
          width: double.infinity,
         child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text('Let\'s check your answers together !',
              style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            const Expanded(child: QuestionsSummary()),
          ],
        ),
      ),
    ),
    );
  }
}
