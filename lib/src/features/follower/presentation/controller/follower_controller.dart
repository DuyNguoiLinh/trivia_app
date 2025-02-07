import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/follower/domain/repository/follower_repository.dart';
import 'package:trivia_app_with_flutter/src/features/user/global_variables.dart';

final stateFollowerProvider = StateProvider.family.autoDispose<bool, String>((
    ref, receiveUid) => false);

class FollowerNotifier extends AutoDisposeFamilyAsyncNotifier<bool, String> {

  final _followerRepository = FollowerRepository.created();

  @override
  FutureOr<bool> build(String receiveUid) async {
    state=const AsyncValue.loading();
    final following = await _followerRepository.checkFollowing(
        uidGlobal, receiveUid);
    // state = AsyncValue.data(following);
    ref.read(stateFollowerProvider(receiveUid).notifier).state=following;
    return following;
  }

  Future<void> toggleFollow(receiverUid) async {
    try {
      final following = await _followerRepository.addToFollowUp(
          uidGlobal, receiverUid);
      state = AsyncValue.data(following);
    } catch (err) {
      return Future.error(err);
    }
  }

  Future<void> cancelFollower(String followId) async {
    try {
      await _followerRepository.cancelFollower(followId);
    } catch (err) {
      return Future.error(err);
    }
  }
}


final followerProvider =
AsyncNotifierProvider.family.autoDispose <FollowerNotifier, bool, String>(
      () => FollowerNotifier(),
);
