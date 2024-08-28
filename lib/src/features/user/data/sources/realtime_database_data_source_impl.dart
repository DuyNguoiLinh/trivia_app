import 'package:firebase_database/firebase_database.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/coin_realtime_database_model.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/realtime_database_data_source.dart';
import '../model/firebase_model/follow_realtime_database_model.dart';

class RealtimeDatabaseDataSourceImpl implements RealtimeDatabaseDataSource {

  final DatabaseReference _coinRef = FirebaseDatabase.instance.ref().child('coin');
  final DatabaseReference _followingRef = FirebaseDatabase.instance.ref().child('following');


  @override
  Future<void> sendCoinRealtime(String uid, CoinRealtimeDatabaseModel newCoin) async {
    try {
        await _coinRef.child(uid).push().set(newCoin.toJson());
    } catch (err) {
      return Future.error(err);
    }
  }


  Future<void> follow(String uid , FollowRealtimeDatabaseModel follow) async {
    try{
      await _followingRef.child(follow.uidFollower).set(follow.toJson());
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Stream<CoinRealtimeDatabaseModel?> listenToCoinChanges(String uid,int now) {

     return _coinRef.child(uid).orderByChild('ts').startAfter(now).onChildAdded.map((event) {
      final coinData = event.snapshot.value as Map?;
      if (coinData != null) {
        return CoinRealtimeDatabaseModel.fromJson(Map<String, dynamic>.from(coinData));
      } else {
        return null;
      }
    });
  }

  // Stream<FollowRealtimeDatabaseModel?> listenToFollower(String uid) {
  //
  // }

  // @override
  // Future<void> addCoin(String uid , double coin) async {
  //   try {
  //      final snapshot = await _coinRef.child(uid).child('coin').get();
  //
  //      if(snapshot.exists) {
  //        var coinValue = snapshot.value;
  //
  //        if(coinValue is int) {
  //          coinValue= coinValue.toDouble() +coin;
  //        } else if(coinValue is double){
  //          coinValue= coinValue +coin;
  //        }
  //
  //        await _coinRef.child(uid).update({'coin' : coinValue});
  //      }
  //   } catch (err) {
  //     return Future.error(err);
  //   }
  // }

  // @override
  // Future<void> subtractCoin(String uid , double coin) async {
  //   try {
  //     final snapshot = await _coinRef.child(uid).child('coin').get();
  //
  //     if(snapshot.exists) {
  //       var coinValue = snapshot.value;
  //       if(coinValue is int) {
  //         coinValue= coinValue.toDouble() -coin;
  //       } else if(coinValue is double){
  //         coinValue= coinValue -coin;
  //       }
  //
  //       await _coinRef.child(uid).update({'coin' : coinValue});
  //     }
  //   } catch (err) {
  //     return Future.error(err);
  //   }
  // }



  // // delete User
  // @override
  // Future<void> deleteUser(String uid) async {
  //   try {
  //     await _coinRef.child(uid).remove();
  //   } catch (err) {
  //     return Future.error(err);
  //   }
  // }
}
//
// Future<void>  saveLastKey(String lastKey) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('lastKey', lastKey);
// }
//
// Future<String?> getLastKey() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString('lastKey');
// }