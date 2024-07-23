import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/result_controller/data_result_controller.dart';
import '../../screen/result_screen.dart';

class SubmitButton extends ConsumerWidget{
  const SubmitButton({super.key,required this.answeredAll});
   final bool answeredAll;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

   return  ElevatedButton(
     onPressed: () {
       if(answeredAll){
         ref.read(dataResultProvider.notifier).analysisQuiz();
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) =>  const ResultScreen() ),
         );
       } else {
         showDialog(
             context: context,
             builder: (ctx) => AlertDialog(
               title: const Text('Answer all to submit!'),
               content: const Text(
                   'You have not answered all the questions, please check again'),
               actions: [
                 TextButton(
                     onPressed: () {
                       Navigator.pop(ctx);
                     },
                     child: const Text('Okay'))
               ],
             ));
       }
     },
     style: ElevatedButton.styleFrom(
         backgroundColor: Colors.blueAccent,
         elevation: 10
     ),
     child: const Text('Submit',style: TextStyle(fontSize: 24,color: Colors.white)),
   );
  }

}