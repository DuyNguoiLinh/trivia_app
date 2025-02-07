import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/follower/domain/repository/follower_repository.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/widget/model_follower_with_pagination.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';

typedef ActivityParameters = ({String uid, String type});

class ListFollowerNotifier extends AutoDisposeFamilyAsyncNotifier<
    ModelFollowerWithPagination<UserEntity>,ActivityParameters> {

  final int _pageSize = 5;
  final _followerRepository = FollowerRepository.created();
  String _uid = '';
  List<UserEntity> _listFollower = List<UserEntity>.empty(growable: true);

  String type = 'following';

  @override
  FutureOr<ModelFollowerWithPagination<UserEntity>> build(arg) async {

    ref.onDispose(() {
      print('onDispose following');
    });

    _uid = arg.uid;
    type = arg.type;

    if (type == 'following') {
      _listFollower =
      await _followerRepository.getListFollowing(_uid, 0, _pageSize);
    } else {
      _listFollower =
      await _followerRepository.getListFollower(_uid, 0, _pageSize);
    }
    return ModelFollowerWithPagination(nextPageKey: 1, data: _listFollower);
  }

  Future<void> fetchPageFollower(int pageIndex) async {
    try {
      if (type == 'following') {
        _listFollower =
        await _followerRepository.getListFollowing(_uid, pageIndex, _pageSize,);
      } else {
        _listFollower =
        await _followerRepository.getListFollower(_uid, pageIndex, _pageSize,);
      }

      final currentList = List<UserEntity>.empty(growable: true);

      final currentData = state.valueOrNull;

      currentList
          .addAll(currentData?.data ?? List<UserEntity>.empty(growable: true));

      if (_listFollower.isNotEmpty && _listFollower.length >= _pageSize) {
        currentList.addAll(_listFollower);

        final nextPage = ModelFollowerWithPagination(
          nextPageKey: pageIndex + 1,
          data: currentList,
        );

        state = AsyncValue.data(nextPage);
      } else {
        currentList.addAll(_listFollower);
        final lastPage =
        ModelFollowerWithPagination(nextPageKey: null, data: currentList);

        state = AsyncValue.data(lastPage);
      }
    } catch (err, stackTr) {
      state = AsyncValue.error(err, stackTr);
    }
  }
}

final listFollowerProvider = AsyncNotifierProvider.family.autoDispose<
    ListFollowerNotifier,
    ModelFollowerWithPagination<UserEntity>,
    ActivityParameters>(() => ListFollowerNotifier());
