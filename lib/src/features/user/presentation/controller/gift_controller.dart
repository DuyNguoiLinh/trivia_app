import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

import '../../global_variables.dart';

class GiftNotifier extends AutoDisposeAsyncNotifier<double> {

  final _userRepository = UserRepository.create();
  StreamSubscription<double>? _subscription;
  @override
  FutureOr<double> build() {
    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription= _userRepository.listenToCoinChanges(uid).listen((newValue) async {
      state=AsyncValue.data(newValue);
    });
   return coin;
  }

  Future<void> sendCoin(String receiverUid, double amountCoin) async{
    try{
      await _userRepository.sendCoin(uid, receiverUid, amountCoin);
    } catch(err,stackTr) {
      state =AsyncValue.error(err,stackTr);
    }
  }

}

final giftProvider= AsyncNotifierProvider.autoDispose<GiftNotifier,double>(() => GiftNotifier());