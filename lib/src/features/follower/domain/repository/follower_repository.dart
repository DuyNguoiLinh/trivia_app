import 'package:trivia_app_with_flutter/src/features/follower/data/repository/follower_repository_impl.dart';

import '../../../user/domain/entity/user_entity.dart';
import '../entity/follower_entity.dart';

abstract class FollowerRepository {

  Future<bool> addToFollowUp(
    String senderUid,
    String receiverUid,
  );

  Future<bool> checkFollowing(String senderUid, String receiveUid);

  Future<List<UserEntity>>  getListFollowing(String uid,int pageIndex , int pageSize);

  Future<List<UserEntity>> getListFollower(String uid,int pageIndex , int pageSize );

  Future<FollowerEntity> amountFollow(String uid);

  Future<List<UserEntity>> getTopFollowing (
      int pageIndex, int pageSize,String uid );

  Stream<int>  streamFollower(String uid);

  Stream<int>  streamFollowing(String uid);

  Future<void>  cancelFollower(String followId);

  factory FollowerRepository.created() {
    return FollowerRepositoryImpl();
  }
}
