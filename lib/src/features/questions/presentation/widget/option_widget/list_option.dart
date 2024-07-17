import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/answer_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/parametter_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_async_notifier_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/question_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/option_widget/option_button.dart';

class ListOptions extends ConsumerWidget {
  const ListOptions({super.key,required this.nameCategory});
  final String nameCategory;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Column(
     children: [
       Container(
            alignment: Alignment.centerLeft,
           margin: const EdgeInsets.only(left: 10),
           child: const Text("Select Difficulty" , style: TextStyle(fontSize: 20),)),
      const SizedBox(height: 15,),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10,),
          Expanded(child: ButtonOption(nameOption: 'Random',typeOption: 'difficulty')),
          SizedBox(width: 10,),
          Expanded(child: ButtonOption(nameOption: 'Easy',typeOption: 'difficulty',nameParameter: 'easy',)),
          SizedBox(width: 10,),
          Expanded(child: ButtonOption(nameOption: 'Medium',typeOption: 'difficulty',nameParameter: 'medium',)),
          SizedBox(width: 10,),
          Expanded(child: ButtonOption(nameOption: 'Hard',typeOption: 'difficulty',nameParameter: 'hard',)),
          SizedBox(width: 10,),
        ],
      ),
       const SizedBox(height: 15,),
       Container(
           alignment: Alignment.centerLeft,
           margin: const EdgeInsets.only(left: 10),
           child: const Text("Choose the Type of questions", style: TextStyle(fontSize: 20))),
       const SizedBox(height: 15,),
       const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox( width:double.infinity  ,child: ButtonOption(nameOption: 'True/False',typeOption: 'type',nameParameter: 'boolean',)),
             SizedBox(height: 15,),
             SizedBox(width:double.infinity  ,child: ButtonOption(nameOption: 'Multiple choice',typeOption: 'type',nameParameter: 'multiple',)),
             SizedBox(height: 15,),
             SizedBox(width:double.infinity  ,child: ButtonOption(nameOption: 'Any Type',typeOption: 'type')),
             SizedBox(height: 15,),
           ],),
        ),
       Container(
           alignment: Alignment.centerLeft,
           margin: const EdgeInsets.only(left: 10),
           child: const Text("Choose the number of Question" , style: TextStyle(fontSize: 20),)),
       const SizedBox(height: 15,),
       const Row(
         children: [
           SizedBox(width: 10,),
           Expanded(child: ButtonOption(nameOption: '5 Question',typeOption: 'amount',nameParameter:5,)),
           SizedBox(width: 10,),
           Expanded(child: ButtonOption(nameOption: '10 Question',typeOption: 'amount',nameParameter:10,)),
           SizedBox(width: 10,),
         ],
       ),
       const SizedBox(height: 15,),
       Container(
           alignment: Alignment.centerLeft,
           margin: const EdgeInsets.only(left: 10),
           child: const Text("Good luck for your quiz", style: TextStyle(fontSize: 20))),
       const SizedBox(height: 15),
       InkWell(
         onTap: () {
           // check pick options"
           final options=ref.read(parameterProvider.notifier).checkParameter();
           if(options == false){
             showDialog(
                 context: context,
                 builder: (ctx) => AlertDialog(
                   title: const Text('Check your options'),
                   content: const Text(
                       'Please pick all options to get started'),
                   actions: [
                     TextButton(
                         onPressed: () {
                           Navigator.pop(ctx);
                         },
                         child: const Text('Okay'))
                   ],
                 ));
           } else {
             ref.read(asyncQuizProvider.notifier).fetchNewQuiz();
             ref.read(answerProvider.notifier).clearAnswerInMap();
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) =>  QuestionScreen(nameCategory: nameCategory,)),
             );
           }
           },
         child: Container(
           // margin: EdgeInsets.only(left: 150),
           padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 10),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
             color: Colors.blue,
           ),
           child: const Text(
             'Next',
             style:
             TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
           ),
         ),
       )
     ],
   );
  }

}