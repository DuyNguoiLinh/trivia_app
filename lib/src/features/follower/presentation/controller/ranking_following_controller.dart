import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/follower/data/repository/follower_repository_impl.dart';
import 'package:trivia_app_with_flutter/src/features/follower/domain/repository/follower_repository.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/global_variables.dart';

class RankingFollowingNotifier
    extends AutoDisposeAsyncNotifier<List<UserEntity>> {
  final _followerRepository = FollowerRepository.created();
  int nextPagekey = 1;
  final int _pageSize = 5;

  @override
  FutureOr<List<UserEntity>> build() async {
    final listTopFollowing =
        await _followerRepository.getTopFollowing(0, _pageSize, uidGlobal);

    return listTopFollowing;
  }

  Future<void> fetchPageTopFollowing(int pageIndex) async {
    try {
      // await Future.delayed(const Duration(seconds: 5));
      final listTopFollowing = await _followerRepository.getTopFollowing(
        pageIndex,
        _pageSize,
        uidGlobal,
      );

      state = AsyncValue.data([...listTopFollowing]);
      nextPagekey++;
    } catch (err, stackTr) {
      state = AsyncValue.error(err, stackTr);
      return Future.error(err);
    }
  }
}

final rankingFollowingProvider =
    AsyncNotifierProvider.autoDispose<RankingFollowingNotifier, List<UserEntity>>(
        () => RankingFollowingNotifier());
