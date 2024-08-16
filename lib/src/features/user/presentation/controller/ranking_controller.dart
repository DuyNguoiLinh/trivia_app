import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

class RankingNotifier extends AutoDisposeAsyncNotifier<List<UserEntity>> {

  final _userRepository = UserRepository.create();


  @override
  FutureOr<List<UserEntity>> build() {
    return [];
  }

  Future<void> fetchPageUser(int pageIndex, int pageSize) async {
    try {
      // await Future.delayed(const Duration(seconds: 5));
      final listUserSort = await _userRepository.fetchUserSortedByCoin(pageIndex, pageSize);
      // final currentListUser = state.value ?? [];
      state=AsyncValue.data([...listUserSort]);
    } catch (err,stackTr) {
      state=AsyncValue.error(err,stackTr);
    }
  }
}

final rankingProvider =
    AsyncNotifierProvider.autoDispose<RankingNotifier, List<UserEntity>>(
        () => RankingNotifier());
