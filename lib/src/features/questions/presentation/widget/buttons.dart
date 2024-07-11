import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_async_notifier_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/user_info_future_rovider.dart';

class Buttons extends ConsumerWidget{
  final  nameController =TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameAsync= ref.watch(getInfoProvider);
    final userName =userNameAsync.value;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Center(
            child: Text('Challenge yourself with our interactive quizzes and discover how much you know about various topics.',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 50,),
          const Text(
            'Username',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
         if(userName?.isEmpty == true)
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                )),
            child:  TextField(
              controller: nameController,
              decoration:
              const InputDecoration(label: Text('Enter your usename'),
                  border: InputBorder.none
              ),
            ),
          ),
          if(userName?.isNotEmpty == true)
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  )),
              child:  Text(userName.toString(),style: TextStyle(fontSize: 24),)
            ),
          const SizedBox(
              height: 100
          ),
          InkWell(
            onTap: () {
              final name=nameController.text;
              if( name.isNotEmpty ){
                ref.read(asyncQuizProvider.notifier).saveUseName(name);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const Text(
                'Get Start',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          )
        ],
      ),
    );
  }
  
}