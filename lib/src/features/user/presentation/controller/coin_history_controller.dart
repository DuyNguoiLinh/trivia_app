import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/model_with_pagination.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/router_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/wallet_widget/coin_history_item.dart';

// page Index Provider

final pageIndexProvider = StateProvider<int>((ref) => 0);

class CoinHistoryNotifier
    extends AutoDisposeAsyncNotifier<ModelWithPagination<CoinHistoryEntity>> {
  final int pageSize = 5;

  final _userRepository = UserRepository.create();

  String _uid = '';

  @override
  FutureOr<ModelWithPagination<CoinHistoryEntity>> build() async {
    final authState = ref.watch(authStateProvider);
    _uid = authState.asData?.value?.uid ?? '';

    final listCoinHistory =
        await _userRepository.getCoinHistories(0, pageSize, _uid);

    return ModelWithPagination(nextPageKey: 1, data: listCoinHistory);
  }

  Future<void> fetchPage(int pageIndex) async {
    try {
      final listCoinHistory =
          await _userRepository.getCoinHistories(pageIndex, pageSize, _uid);

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

      await _userRepository.deleteCoinHistory(id, _uid);
    } catch (err, stackTr) {
      state = AsyncValue.error(err, stackTr);
    }
  }
}

final coinHistoryProvider = AsyncNotifierProvider.autoDispose<
    CoinHistoryNotifier,
    ModelWithPagination<CoinHistoryEntity>>(() => CoinHistoryNotifier());
