import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class QuizBottomNavigationBar extends ConsumerWidget {
  const QuizBottomNavigationBar({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey<String>('QuizBottomNavigatorBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexSelect = ref.watch(isSelect);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar:  BottomNavigationBar(
        // backgroundColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: indexSelect == 0 ? Colors.purple : Colors.black38,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet,
                  color: indexSelect == 1 ? Colors.purple : Colors.black38),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_sharp,
                  size: 25,
                  color: indexSelect == 2 ? Colors.purple : Colors.black38),
              label: 'Ranking'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined,
                  size: 25,
                  color: indexSelect == 3 ? Colors.purple : Colors.black38),
              label: 'Ranking'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_rounded,
              size: 20,
              color: indexSelect == 4 ? Colors.purple : Colors.black38,),
              label: 'Gift'
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) {
          ref.read(isSelect.notifier).state=index;
          navigationShell.goBranch(index);
        }
      ),
    );
  }
}

final isSelect = StateProvider<int>((ref) => 0);
