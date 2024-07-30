import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/home_screen.dart';
import '../../../../user/presentation/controller/user_controller.dart';

class ButtonStartScreen extends ConsumerWidget{
  ButtonStartScreen({super.key});

  final  userNameController =TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // get use name
    final asyncUser= ref.watch(userProvider);
    final userInfo = asyncUser.valueOrNull;

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

               if(userInfo == null)

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
                     controller: userNameController,
                     decoration:
                     const InputDecoration(label: Text('Enter your username'),
                         border: InputBorder.none
                     ),
                   ),
                 ),

               if(userInfo != null)

                 Container(
                     margin: const EdgeInsets.only(top: 20),
                     padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 5),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         border: Border.all(
                           color: Colors.blue,
                           width: 2,
                         )),
                     child:  Text(userInfo.userName.toString(),style: const TextStyle(fontSize: 24),)
                 ),
               const SizedBox(
                   height: 100
               ),


               InkWell(
                 onTap: () {

                   final name=userNameController.text;

                   if( name.isNotEmpty == true){

                     ref.read(userProvider.notifier).saveUseName(name);
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const HomeScreen()),
                     );

                     //   navigator.push
                   } else if(userInfo != null ){

                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const HomeScreen()),
                     );

                   } else {
                     null;
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