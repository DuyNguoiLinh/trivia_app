import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/coin_history_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/wallet_widget/coin_history_item.dart';

class ListCoinHistory extends ConsumerWidget {
  const ListCoinHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pageIndex = ref.watch(pageIndexProvider);

    final asyncCoinHistories = ref.watch(coinHistoryProvider(pageIndex));

    final listCoinHistory = asyncCoinHistories.maybeMap(
        data: (data) => data.value,
        orElse: () => List<CoinHistoryEntity>.empty(growable: true));


    return Column(
      children: [
        SizedBox(
          height: 350,
          child: ListView.builder(
            itemCount: listCoinHistory.length,
            itemBuilder: (context, index) {
              return CoinHistoryItem(coinHistoryEntity: listCoinHistory[index]);
            },
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              if(pageIndex != 0)

              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  ref.read(pageIndexProvider.notifier).state--;
                },
              ),

               if(pageIndex == 0)
                 const SizedBox(width: 15,),

               if(listCoinHistory.isNotEmpty)

               Text( pageIndex.toString(),
                style: const TextStyle(fontSize: 22),
              ),

              if(listCoinHistory.length == 5)

              IconButton(
                icon: const Icon(Icons.arrow_forward_ios_outlined),
                onPressed: () {
                  ref.read(pageIndexProvider.notifier).state++;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
