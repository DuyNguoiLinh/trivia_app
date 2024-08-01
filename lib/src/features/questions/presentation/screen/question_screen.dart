import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/option_controller/parametter_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/home_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/question_item.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key,});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final nameCategory=ref.read(parameterProvider.notifier).getNameCategory();

   return Scaffold(
     appBar: AppBar(
       leading: Container(
         width: 100,
         alignment: Alignment.center,
         child: TextButton(

           onPressed: () {

             showDialog(
                 context: context,
                 builder: (ctx) => AlertDialog(
                   title: const Text('Are you sure you want to exit ? '),
                   actions: [

                     TextButton(
                       onPressed: () {
                         Navigator.pop(ctx);
                       },
                       child: const Text('Cancel', style: TextStyle(fontSize: 24, color: Colors.blue)),
                     ),

                     TextButton(
                       onPressed: () {
                         Navigator.pop(ctx);
                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) => const HomeScreen()),
                         );
                       },
                       child: const Text('Exit', style: TextStyle(fontSize: 24, color: Colors.red)),
                     ),
                   ],
                 ));

           },
           child: const Text("Exit",style: TextStyle(fontSize: 18, color: Colors.black),),

         ),
       ),
       title: Container(
            margin: const EdgeInsets.only(left: 80),
           child:  const Text('hehe')),
     ),
     body:   const QuestionView(),
   );
  }

}
