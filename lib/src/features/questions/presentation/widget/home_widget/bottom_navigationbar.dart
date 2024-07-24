import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizBottomNavigationBar extends ConsumerWidget{
  const QuizBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return  BottomNavigationBar(
     // backgroundColor: Colors.cyan,
       items: const <BottomNavigationBarItem>  [
         BottomNavigationBarItem(
             icon: Icon(Icons.home),
           label:  'Home',
         ),
         BottomNavigationBarItem(
             icon: Icon(Icons.wallet),
             label: 'Wallet'
         )
       ]
   );
  }

}