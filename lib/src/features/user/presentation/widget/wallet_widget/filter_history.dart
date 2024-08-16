import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/app_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/filter_controller.dart';

class FilterHistory extends ConsumerWidget {
  const FilterHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final index=ref.watch(filterWalletProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            color: index == 0 ? Colors.redAccent  :Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () {
              ref.read(filterWalletProvider.notifier).state=0;
            },
            child: const Row(
              children: [
                Icon(Icons.monetization_on, size: 24.0, color: Colors.yellow),
                SizedBox(width: 5),
                Text(
                  'Earn Coin',
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            color: index == 1 ? Colors.redAccent  :Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () {
              ref.read(filterWalletProvider.notifier).state=1;
              // ref.read(appProvider.notifier).fetchQuestionFavorite();
            },
            child: const Row(
              children: [
                Icon(Icons.favorite, size: 24.0, color: Colors.red),
                SizedBox(width: 5),
                Text(
                  'Question',
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}