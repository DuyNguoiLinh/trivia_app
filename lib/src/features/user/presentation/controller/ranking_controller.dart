import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';

class RankingNotifier extends AutoDisposeAsyncNotifier<List<UserEntity>> {

  final _userRepository = UserRepository.create();
  int nextPagekey = 1;
 final int _pageSize = 5;

  @override
  FutureOr<List<UserEntity>> build() async {

    final listUserSort = await _userRepository.fetchUserSortedByCoin(0, 5);

    return listUserSort;
  }

  Future<void> fetchPageUser(int pageIndex) async {
    try {
      // await Future.delayed(const Duration(seconds: 5));
      final listUserSort = await _userRepository.fetchUserSortedByCoin(pageIndex, _pageSize);

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
