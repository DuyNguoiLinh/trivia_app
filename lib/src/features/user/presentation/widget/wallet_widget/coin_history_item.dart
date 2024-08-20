import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/coin_history_controller.dart';

class CoinHistoryItem extends ConsumerWidget {
  const CoinHistoryItem({super.key, required this.coinHistoryEntity,required this.onPressed});

  final CoinHistoryEntity coinHistoryEntity;
 final  VoidCallback onPressed;

  // parse datetime -> String
  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMMM d, yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pageIndex = ref.watch(pageIndexProvider);

    final isGift=coinHistoryEntity.type.contains('gift');

    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: coinHistoryEntity.type.contains('fee') ? Colors.red.withOpacity(0.8) : Colors.green,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                isGift ? 'assets/images/giftbox.png' :
                  coinHistoryEntity.type == 'fee'
                  ? 'assets/images/down.png'
                  : 'assets/images/up .png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Spacer(),
        Text(
          formatDate(coinHistoryEntity.timestamp),
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
        const Spacer(),
        Text(
          coinHistoryEntity.type == 'fee' ?
          ' - ${(coinHistoryEntity.amountEarnCoin).toString()} coin'
           :  ' + ${(coinHistoryEntity.amountEarnCoin).toString()} coin',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            onPressed();
          },
          color: Colors.black54,
          iconSize: 30.0,
        ),
      ]),
    );
  }
}
