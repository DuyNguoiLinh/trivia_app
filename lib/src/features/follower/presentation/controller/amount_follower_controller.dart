import 'dart:async';
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/follower/domain/entity/follower_entity.dart';
import 'package:trivia_app_with_flutter/src/features/follower/domain/repository/follower_repository.dart';

class AmountFollowerNotifier
    extends AutoDisposeFamilyAsyncNotifier<FollowerEntity, String> {
  final _followerRepository = FollowerRepository.created();

  StreamSubscription<int>? _followerSubscription;
  StreamSubscription<int>? _followingSubscription;

  int following = 0;
  int follower = 0;

  @override
  FutureOr<FollowerEntity> build(String uid) async {
    // final amountFollower = await _followerRepository.amountFollow(uid);
    //
    // following = amountFollower.amountFollowing;
    // follower = amountFollower.amountFollower;
    final amountFollower = FollowerEntity(
      amountFollowing: following,
      amountFollower: follower,
    );

    ref.onDispose(
      () {
        _followerSubscription?.cancel();
        _followingSubscription?.cancel();
      },
    );

    _followerSubscription = _followerRepository.streamFollower(uid).listen(
      (newValue) async {
        follower =newValue;
        final newFollow = FollowerEntity(
          amountFollowing: following,
          amountFollower: follower,
        );
        state = AsyncValue.data(newFollow);
      },
    );

    _followingSubscription = _followerRepository.streamFollowing(uid).listen(
      (newValue) async {
        following=newValue;
        final newFollow = FollowerEntity(
          amountFollowing: following,
          amountFollower: follower,
        );
        state = AsyncValue.data(newFollow);
      },
    );

    return amountFollower;
  }
}

final amountFollowerProvider = AsyncNotifierProvider.family
    .autoDispose<AmountFollowerNotifier, FollowerEntity, String>(
        () => AmountFollowerNotifier());
