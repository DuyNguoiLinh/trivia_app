import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

class RankingNotifier extends AutoDisposeAsyncNotifier<List<UserEntity>> {

  final _userRepository = UserRepository.create();
  int nextPagekey = 1;

  @override
  FutureOr<List<UserEntity>> build() async {
    ref.onDispose(() => print("RankingNotifier disposeeeeeeeee"),);
    // final listUserSort = await _userRepository.fetchUserSortedByCoin(nextPagekey, 3);
    final listUserSort = await _userRepository.fetchUserSortedByCoin(0, 3);
    // return listUserSort;
    return listUserSort;
  }

  Future<void> fetchPageUser(int pageIndex, int pageSize) async {
    try {
      // await Future.delayed(const Duration(seconds: 5));
      final listUserSort = await _userRepository.fetchUserSortedByCoin(pageIndex, pageSize);
      // final currentListUser = state.value ?? [];

      state = AsyncValue.data([...listUserSort]);
        nextPagekey++;

    } catch (err,stackTr) {
      state=AsyncValue.error(err,stackTr);
      return Future.error(err);
    }
  }

  }



final rankingProvider =
    AsyncNotifierProvider.autoDispose<RankingNotifier, List<UserEntity>>(
        () => RankingNotifier());
