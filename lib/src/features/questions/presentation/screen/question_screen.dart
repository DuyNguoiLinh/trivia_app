import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/home_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/question_widget/question_item.dart';

import '../../domain/entity/question_entity.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameCategory=ref.watch(nameCategoryProvider);
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

                           Navigator.pushReplacement(
                             context,
                             MaterialPageRoute(builder: (context) => const HomeScreen()),
                           );

                         },
                         child: const Text('Exit',style: TextStyle(fontSize: 24 ,color: Colors.red),))
                   ],
                 ));


           },
           child: const Text("Exit",style: TextStyle(fontSize: 18, color: Colors.black),),

         ),
       ),
       title: Container(
            margin: const EdgeInsets.only(left: 80),
           child:  Text(nameCategory)),
     ),
     body:   const QuestionItem(),
   );
  }

}
final nameCategoryProvider = StateProvider<String>( (ref) => '');