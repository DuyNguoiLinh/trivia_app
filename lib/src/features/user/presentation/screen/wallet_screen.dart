import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/wallet_widget/filter_history.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/wallet_widget/list_category_has_question.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/wallet_widget/list_coin_history.dart';

import '../controller/filter_controller.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final index=ref.watch(filterWalletProvider);

    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Icon(
                  Icons.history,
                  size: 32,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Transaction History',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Center(
              child: Image.asset(
                'assets/images/mining_bitcoin.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
              const SizedBox(
              height: 10,
            ),
               const FilterHistory(),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 3,
                  color: Colors.white54,
                ),
                const SizedBox(height: 10,),

                if(index==0)

                const Expanded(child: ListCoinHistory()),

                if(index == 1)

                  const Expanded(child: ListCategoryHasQuestion()),
          ]),
        ));
  }
}
