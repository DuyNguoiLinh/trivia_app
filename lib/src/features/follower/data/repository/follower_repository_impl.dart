import 'package:ntp/ntp.dart';
import 'package:trivia_app_with_flutter/src/features/follower/data/model/follow_firestore_model.dart';
import 'package:trivia_app_with_flutter/src/features/follower/data/sources/firestore_follow_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/follower/domain/entity/follower_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/firestore_user_data_source.dart';
import '../../../user/data/model/firebase_model/user_firestore_model.dart';
import '../../../user/domain/entity/user_entity.dart';
import '../../domain/repository/follower_repository.dart';

class FollowerRepositoryImpl implements FollowerRepository {

  final _followerFirestoreDataSource = FirestoreFollowDataSource.create();
  final _userFirestoreDatatSource = FirestoreUserDataSource.create();

  @override
  Future<bool> addToFollowUp(
    String senderUid,
    String receiverUid,
  ) async {
    try {
      final timeNtp = await NTP.now();
      final createdAt = timeNtp.millisecondsSinceEpoch;

      final follower = FollowFirestoreModel(
        senderId: senderUid,
        receiverId: receiverUid,
        createdAt: createdAt,
      );

      final following = await _followerFirestoreDataSource.toggleFollow(
          follower, senderUid, receiverUid);

      return following;
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Future<bool> checkFollowing(String senderUid, String receiveUid) async {
    try {
      final following =
          await _followerFirestoreDataSource.checkFollowing(senderUid, receiveUid);
      return following;

    } catch (err) {
      return Future.error(err);
    }
  }

  // get list following
  @override
  Future<List<UserEntity>>  getListFollowing(String uid,int pageIndex , int pageSize) async {
    try {
       final List<String> listFollowerUid =await _followerFirestoreDataSource.getListFollowing(uid,pageIndex,pageSize);

       final listFollower = await _userFirestoreDatatSource.getListFollower(pageIndex, pageSize, listFollowerUid);

       return listFollower.map((e) => UserEntity.fromFirestore(e)).toList();

    } catch(err) {
      return Future.error(err);
    }
  }

  //   get list follower
  @override
  Future<List<UserEntity>> getListFollower(String uid,int pageIndex , int pageSize ) async {
    try {

      final List<String> listFollowerUid =await _followerFirestoreDataSource.getListFollower(uid,pageIndex,pageSize);

      final listFollower = await _userFirestoreDatatSource.getListFollower(pageIndex, pageSize, listFollowerUid);

      return listFollower.map((e) => UserEntity.fromFirestore(e)).toList();

    } catch(err) {
      return Future.error(err);
    }
  }

  // get top Following
  @override
  Future<List<UserEntity>> getTopFollowing (
      int pageIndex, int pageSize,String uid ) async {
    try {
      final List<String> topFollowingUid =await _followerFirestoreDataSource.getTopFollowing(uid,pageSize);

      final listTopFollowing = await _userFirestoreDatatSource.getTopFollowing(pageIndex, pageSize, topFollowingUid);

      return listTopFollowing.map((e) => UserEntity.fromFirestore(e)).toList();

    } catch (err) {
      return Future.error(err);
    }
  }

  //  get amount follower
  @override
  Future<FollowerEntity> amountFollow(String uid) async {
    try {

        final amountFollowing = await _followerFirestoreDataSource.amountFollowing(uid);
        final amountFollower = await _followerFirestoreDataSource.amountFollower(uid);

       return FollowerEntity(amountFollowing: amountFollowing, amountFollower: amountFollower);
    } catch (err) {
      return Future.error(err);
    }
  }
  //  stream follower
  @override
  Stream<int>  streamFollower(String uid) {
    return _followerFirestoreDataSource.streamFollower(uid);
  }

  @override
  Stream<int>  streamFollowing(String uid) {
    return _followerFirestoreDataSource.streamFollowing(uid);
  }


  // Cancel follower
  @override
  Future<void> cancelFollower(String followId) async {
    try {
      await _followerFirestoreDataSource.cancelFollower(followId);
    } catch (err) {
      return Future.error(err);
    }
  }
}
