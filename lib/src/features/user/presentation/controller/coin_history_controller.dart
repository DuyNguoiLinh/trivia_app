import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/router_controller.dart';

// page Index Provider

final pageIndexProvider =StateProvider<int>((ref) => 0);

class CoinHistoryNotifier
    extends AutoDisposeAsyncNotifier<List<CoinHistoryEntity>> {


  final int pageSize = 10 ;
  final _userRepository = UserRepository.create();

  String _uid = '';
  @override
  FutureOr<List<CoinHistoryEntity>> build() async {

    final authState = ref.watch(authStateProvider);
    _uid = authState.asData?.value?.uid ?? '';

    return [];
  }


  Future<void> fetchPage(int pageIndex) async {
    try {
        final listCoinHistory = await _userRepository.getCoinHistories(pageIndex, pageSize, _uid);
        final currentList = state.value ?? [];
        state=AsyncValue.data([...currentList, ...listCoinHistory]);
    } catch (err,stackTr) {
      state=AsyncValue.error(err,stackTr);
    }
  }


  // delete coin history by Id
  Future<void> deleteCoinHistory(String id,) async {
    try {
       final currentList = state.value ?? [];
       currentList.removeWhere((e) => e.idTransaction== id) ;
       state = AsyncValue.data([...currentList]);
       await _userRepository.deleteCoinHistory(id,_uid);
    } catch (err, stackTr) {
      state = AsyncValue.error(err, stackTr);
    }
  }
  }


final coinHistoryProvider = AsyncNotifierProvider.autoDispose<
    CoinHistoryNotifier,List<CoinHistoryEntity>>(() => CoinHistoryNotifier());
