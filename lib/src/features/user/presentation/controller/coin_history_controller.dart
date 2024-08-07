import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

// page Index Provider

final pageIndexProvider =StateProvider<int>((ref) => 0);

class CoinHistoryNotifier
    extends AutoDisposeAsyncNotifier<List<CoinHistoryEntity>> {

  int pageIndex=0;
  List<CoinHistoryEntity> listCoinHistory = List<CoinHistoryEntity>.empty(
      growable: true);

  final userRepository = UserRepository.create();

  StreamSubscription<List<CoinHistoryEntity>>? _subscription;

  @override
  FutureOr<List<CoinHistoryEntity>> build() async {
    listCoinHistory = await userRepository.getCoinHistories(pageIndex);
    // ref.onDispose(() {
    //   _subscription?.cancel();
    // },);
    //
    // _subscription = userRepository.watchCoinHistoryLocal(pageIndex).listen(
    //         (histories) {
    //           histories.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    //       state = AsyncValue.data(histories);
    //     }, onError: (err,stackTr){
    //     state= AsyncValue.error(err,stackTr);
    // }
    // );

    return listCoinHistory;
  }
  // next page
  Future<void> nextPage()  async{

     state=const AsyncValue.loading();
     listCoinHistory=await userRepository.getCoinHistories(++pageIndex);
     state=AsyncValue.data(listCoinHistory);
  }

  // back page
  Future<void> backPage()  async{

    state=const AsyncValue.loading();
    listCoinHistory=await userRepository.getCoinHistories(--pageIndex);
    state=AsyncValue.data(listCoinHistory);
  }
  // get  page index
  int indexByPage() {
    return pageIndex;
  }

  // delete coin history by Id
  Future<void> deleteCoinHistory(int id) async{
    try{

      await userRepository.deleteCoinHistory(id);
      listCoinHistory=await userRepository.getCoinHistories(pageIndex);
      // listCoinHistory.removeWhere((e) => e.id == id);
      state=AsyncValue.data(listCoinHistory);

    } catch (err,stackTr){
      return Future.error(err, stackTr);
    }
  }
}

final coinHistoryProvider = AsyncNotifierProvider.autoDispose<
    CoinHistoryNotifier,List<CoinHistoryEntity>>(() => CoinHistoryNotifier());

