import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

class UserNameNotifier extends AutoDisposeAsyncNotifier<String?> {

  final _userRepository = UserRepository.create();

  @override
  FutureOr<String?> build() {
    return null;
  }
   Future<void> getUserNameByUid(String receiverUid) async {
    try{
     final userName = await _userRepository.getUserNameByUid(receiverUid);
     state=AsyncValue.data(userName);
    } catch (err) {
      return Future.error(err);
    }
   }
}

final userNameProvider =
    AsyncNotifierProvider.autoDispose<UserNameNotifier, String?>(
        () => UserNameNotifier());
