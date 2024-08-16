import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizBottomNavigationBar extends ConsumerWidget{
  const QuizBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final indexSelect=ref.watch(isSelect);

   return  BottomNavigationBar(
        // backgroundColor: Colors.grey,
       items:  <BottomNavigationBarItem>  [
         BottomNavigationBarItem(
             icon: Icon(Icons.home,color: indexSelect == 0 ? Colors.purple : Colors.black38,),
             label:  'Home',
         ),
         BottomNavigationBarItem(
             icon: Icon(Icons.wallet,color: indexSelect == 1 ? Colors.purple : Colors.black38),
             label: 'Wallet'
         ),
         BottomNavigationBarItem(
             icon: Icon(Icons.emoji_events_sharp,size: 25,color: indexSelect == 2 ? Colors.purple : Colors.black38),
             label: 'Ranking'
         )
       ],
     onTap:  (int index) {
         ref.read(isSelect.notifier).state =index;
     },

   );
  }
}

final isSelect =StateProvider.autoDispose<int>((ref) => 0);