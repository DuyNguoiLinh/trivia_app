import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

// page Index Provider

final pageIndexProvider =StateProvider<int>((ref) => 0);

class CoinHistoryNotifier
    extends AutoDisposeAsyncNotifier<List<CoinHistoryEntity>> {


  // List<CoinHistoryEntity> listCoinHistory = List<CoinHistoryEntity>.empty(
  //     growable: true);
  final int pageSize = 10 ;
  final _userRepository = UserRepository.create();



  @override
  FutureOr<List<CoinHistoryEntity>> build() async {
    return [];
  }


  Future<void> fetchPage(int pageIndex) async {
    try {
        await Future.delayed(const Duration(seconds: 2));
        final listCoinHistory = await _userRepository.getCoinHistories(pageIndex,pageSize);
        final currentList = state.value ?? [];
        state=AsyncValue.data([...currentList, ...listCoinHistory]);
    } catch (err,stackTr) {
      state=AsyncValue.error(err,stackTr);
    }
  }


  // delete coin history by Id
  Future<void> deleteCoinHistory(int id,) async {
    try {
       await _userRepository.deleteCoinHistory(id);
       final currentList = state.value ?? [];
       currentList.removeWhere((e) => e.id == id) ;
       state = AsyncValue.data([...currentList]);
    } catch (err, stackTr) {
      state = AsyncValue.error(err, stackTr);
    }
  }
  }


final coinHistoryProvider = AsyncNotifierProvider.autoDispose<
    CoinHistoryNotifier,List<CoinHistoryEntity>>(() => CoinHistoryNotifier());
