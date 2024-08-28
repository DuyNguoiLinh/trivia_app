import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/model_with_pagination.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

import '../../global_variables.dart';

// page Index Provider

final pageIndexProvider = StateProvider<int>((ref) => 0);

class CoinHistoryNotifier
    extends AutoDisposeAsyncNotifier<ModelWithPagination<CoinHistoryEntity>> {
  final int pageSize = 5;

  final _userRepository = UserRepository.create();
  StreamSubscription<List<CoinHistoryEntity>>? _subscription;

  @override
  FutureOr<ModelWithPagination<CoinHistoryEntity>> build() async {

    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = _userRepository.watchCoinHistoryInThirtyDays(uidGlobal).listen(
            (newCoinHistory) {

              if(newCoinHistory.isNotEmpty){
                final currentList = List<CoinHistoryEntity>.empty(growable: true);

                final currentData = state.valueOrNull;

                currentList.addAll(
                    currentData?.data ?? List<CoinHistoryEntity>.empty(growable: true));

                if(currentData?.data.first.idTransaction != newCoinHistory.first.idTransaction){
                  currentList.insertAll(0,newCoinHistory);

                  final newPage = ModelWithPagination(
                      nextPageKey: currentData?.nextPageKey, data: currentList);
                  state = AsyncValue.data(newPage);

                }
              }


        }, onError: (err,stackTr){

    }
    );

    final listCoinHistory =
        await _userRepository.getCoinHistories(0, pageSize, uidGlobal);

    return ModelWithPagination(nextPageKey: 1, data: listCoinHistory);
  }

  Future<void> fetchPage(int pageIndex) async {
    try {
      final listCoinHistory =
          await _userRepository.getCoinHistories(pageIndex, pageSize, uidGlobal);

      final currentList = List<CoinHistoryEntity>.empty(growable: true);

      final currentData = state.valueOrNull;

      currentList.addAll(
          currentData?.data ?? List<CoinHistoryEntity>.empty(growable: true));

      if (listCoinHistory.isNotEmpty && listCoinHistory.length >= pageSize) {
        currentList.addAll(listCoinHistory);
        final nextPage =
            ModelWithPagination(nextPageKey: pageIndex + 1, data: currentList);

        state = AsyncValue.data(nextPage);
      } else {
        currentList.addAll(listCoinHistory);
        final lastPage =
            ModelWithPagination(nextPageKey: null, data: currentList);

        state = AsyncValue.data(lastPage);
      }
    } catch (err, stackTr) {
      state = AsyncValue.error(err, stackTr);
    }
  }

  // delete coin history by Id
  Future<void> deleteCoinHistory(String id) async {
    try {
      final currentData = state.valueOrNull;
      final currentList = state.value?.data ?? [];

      final newList=  currentList.where((e) => e.idTransaction != id).toList();

      final newPage = ModelWithPagination(
          nextPageKey: currentData?.nextPageKey, data: newList);
      state = AsyncValue.data(newPage);

      await _userRepository.deleteCoinHistory(id, uidGlobal);
    } catch (err, stackTr) {
      state = AsyncValue.error(err, stackTr);
    }
  }
}

final coinHistoryProvider = AsyncNotifierProvider.autoDispose<
    CoinHistoryNotifier,
    ModelWithPagination<CoinHistoryEntity>>(() => CoinHistoryNotifier());
