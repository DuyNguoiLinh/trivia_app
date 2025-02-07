import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';
import '../../domain/entity/coin_history_entity.dart';
import '../../global_variables.dart';

class GiftNotifier extends AutoDisposeAsyncNotifier<double> {

  final _userRepository = UserRepository.create();
  StreamSubscription<List<CoinHistoryEntity>>? _firestoreSubscription;

  @override
  FutureOr<double> build() async {
    // final int time = DateTime.now().millisecondsSinceEpoch;

    ref.onDispose(() {
      _firestoreSubscription?.cancel();
    },);


    _firestoreSubscription = _userRepository.streamCoinHistories(uidGlobal).listen(
            (newValue) async{
          await _userRepository.saveCoinHistories(newValue, uidGlobal);
        }, onError: (err,stackTr){
      // state= AsyncValue.error(err,stackTr);
    }
    );

   return coinGlobal;
  }

  Future<void> sendCoin(String receiverUid, double amountCoin,String message) async{
    try{
      await _userRepository.sendCoin(uidGlobal, receiverUid, amountCoin,message);
      state = AsyncValue.data(coinGlobal-amountCoin);
    } catch(err,stackTr) {
      state =AsyncValue.error(err,stackTr);
    }
  }

}

final giftProvider= AsyncNotifierProvider.autoDispose<GiftNotifier,double>(() => GiftNotifier());