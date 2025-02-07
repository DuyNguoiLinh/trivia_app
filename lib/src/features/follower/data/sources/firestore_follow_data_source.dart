import 'package:trivia_app_with_flutter/src/features/follower/data/sources/firestore_follow_data_source_impl.dart';

import '../model/follow_firestore_model.dart';

abstract class FirestoreFollowDataSource {

  Future<bool> toggleFollow(FollowFirestoreModel follower,String senderUid, String receiveUid);

  Future<bool> checkFollowing(String senderUid, String receiveUid);

  Future<List<String>> getListFollowing(String uid,int pageIndex, int pageSize);

  Future<List<String>> getTopFollowing(String uid,int pageSize);

  Future<List<String>> getListFollower(String uid,int pageIndex, int pageSize);

  Future<int> amountFollowing(String uid);

  Future<int> amountFollower(String uid);

  Stream<int>  streamFollower(String uid);

  Stream<int>  streamFollowing(String uid);

  Future<void>  cancelFollower(String followId);

  factory FirestoreFollowDataSource.create() {
    return FirestoreFollowDataSourceImpl();
  }
}