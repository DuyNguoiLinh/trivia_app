import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

// page Index Provider

final pageIndexProvider =StateProvider<int>((ref) => 0);

class CoinHistoryNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<CoinHistoryEntity>,int> {

  List<CoinHistoryEntity> listCoinHistory = List<CoinHistoryEntity>.empty(
      growable: true);

  final userRepository = UserRepository.create();

  StreamSubscription<List<CoinHistoryEntity>>? _subscription;

  @override
  FutureOr<List<CoinHistoryEntity>> build(int pageIndex) async {
    // final listCoinHistory = await userRepository.getCoinHistories(pageIndex);
    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = userRepository.watchCoinHistoryLocal(pageIndex).listen(
            (histories) {
              histories.sort((a, b) => b.timestamp.compareTo(a.timestamp));
          state = AsyncValue.data(histories);
        }, onError: (err,stackTr){
        state= AsyncValue.error(err,stackTr);
    }
    );

    return listCoinHistory;
  }

  Future<void> deleteCoinHistory(int id) async{
    await userRepository.deleteCoinHistory(id);
  }
}

final coinHistoryProvider = AsyncNotifierProvider.family.autoDispose<
    CoinHistoryNotifier,List<CoinHistoryEntity>,int>(() => CoinHistoryNotifier());

