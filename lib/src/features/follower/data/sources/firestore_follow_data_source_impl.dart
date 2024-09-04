import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../model/follow_firestore_model.dart';
import 'firestore_follow_data_source.dart';

class FirestoreFollowDataSourceImpl implements FirestoreFollowDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const uuid = Uuid();

  @override
  Future<bool> toggleFollow(
    FollowFirestoreModel follower,
    String senderUid,
    String receiveUid,
  ) async {
    try {

      final querySnapshot = await _firestore
          .collection('follow')
          .where('senderId', isEqualTo: senderUid)
          .where('receiverId', isEqualTo: receiveUid)
          .get();

      if (querySnapshot.docs.isEmpty) {
        await _firestore
            .collection('follow')
            .doc(uuid.v4())
            .set(follower.toJson());

        return true;

      } else {
        for (var docSnapshot in querySnapshot.docs) {
          await _firestore.collection('follow').doc(docSnapshot.id).delete();
        }
        return false;
      }
    } catch (err) {
      return Future.error(err);
    }
  }
//   check following
  @override
  Future<bool> checkFollowing(String senderUid, String receiveUid) async{
    try{

      final querySnapshot = await _firestore
          .collection('follow')
          .where('senderId', isEqualTo: senderUid)
          .where('receiverId', isEqualTo: receiveUid)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (err) {
      return Future.error(err);
    }
  }
   DocumentSnapshot? _lastFollowingDocumentSnapshot ;
  //  get list followerUid
  @override
  Future<List<String>> getListFollowing(String uid, int pageIndex, int pageSize) async {
    try {

      Query query = await _firestore
          .collection('follow')
          .where('senderId', isEqualTo: uid)
          .orderBy('createdAt' ,descending: true)
           .limit(pageSize);

      if (_lastFollowingDocumentSnapshot != null && pageIndex > 0) {
        query = query.startAfterDocument(_lastFollowingDocumentSnapshot!);
      }
      if(_lastFollowingDocumentSnapshot != null || pageIndex==0 ) {
        QuerySnapshot snapshot = await query.get();

        List<String> receiverIds = snapshot.docs
            .map((doc) => doc['receiverId'] as String)
            .toList();

        if (snapshot.docs.length < pageSize) {
          _lastFollowingDocumentSnapshot = null;
        } else {
          _lastFollowingDocumentSnapshot = snapshot.docs.last;
        }
        return receiverIds;
      } else {
        return [];
      }

    } catch (err) {
      return Future.error(err);
    }
  }
  //   get top following
  @override
  Future<List<String>> getTopFollowing(String uid,int pageSize) async {
    try {

      final  querySnapshot = await _firestore
          .collection('follow')
          .where('senderId', isEqualTo: uid)
          .orderBy('createdAt' ,descending: true)
          .get();

      if(querySnapshot.docs.isNotEmpty) {
        List<String> receiverIds = querySnapshot.docs
            .map((doc) => doc['receiverId'] as String)
            .toList();

        return receiverIds;
      } else {
        return [];
      }


    } catch (err) {
      return Future.error(err);
    }
  }



  DocumentSnapshot? _lastFollowerDocumentSnapshot;
//    get list follower
  @override
  Future<List<String>> getListFollower(String uid,int pageIndex, int pageSize) async {
    try {

      Query query = await _firestore
          .collection('follow')
          .where('receiverId', isEqualTo: uid)
          .orderBy('createdAt' ,descending: true)
          .limit(pageSize);

      if (_lastFollowerDocumentSnapshot != null && pageIndex > 0) {
        query = query.startAfterDocument(_lastFollowerDocumentSnapshot!);
      }
      if(_lastFollowerDocumentSnapshot != null || pageIndex ==0 ) {
        QuerySnapshot snapshot = await query.get();

        List<String> senderIds = snapshot.docs
            .map((doc) => doc['senderId'] as String)
            .toList();

        if (snapshot.docs.length < pageSize) {
          _lastFollowerDocumentSnapshot = null;
        } else {
          _lastFollowerDocumentSnapshot = snapshot.docs.last;
        }
        return senderIds;
      } else {
        return [];
      }
    } catch (err) {
      return Future.error(err);
    }
  }
//    get amount  following
  @override
  Future<int> amountFollowing(String uid) async {
    try {
       final querySnapshot = await _firestore
          .collection('follow')
          .where('senderId', isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isNotEmpty ) {
        return querySnapshot.docs.length;
      } else {
        return 0;
      }
    } catch (err) {
      return Future.error(err);
    }
  }
//   get amount Follower
  @override
  Future<int> amountFollower(String uid) async {
    try {
      final querySnapshot = await _firestore
          .collection('follow')
          .where('receiverId', isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isNotEmpty ) {
        return querySnapshot.docs.length;
      } else {
        return 0;
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Stream<int>  streamFollower(String uid) {
    return _firestore.collection('follow').where('receiverId', isEqualTo: uid).snapshots().map((snapshot) {
       if(snapshot.docs.isNotEmpty) {
         return snapshot.docs.length;
       } else{
         return 0;
       }
    });
  }

  @override
  Stream<int>  streamFollowing(String uid) {
    return _firestore.collection('follow').where('senderId', isEqualTo: uid).snapshots().map((snapshot) {
      if(snapshot.docs.isNotEmpty) {
        return snapshot.docs.length;
      } else {
        return 0;
      }
    });
  }

//   Cancel follower
  @override
  Future<void> cancelFollower(String followId) async {
    try {
      await _firestore.collection('follow').doc(followId).delete();
    } catch (err) {
      return Future.error(err);
    }
  }
}
