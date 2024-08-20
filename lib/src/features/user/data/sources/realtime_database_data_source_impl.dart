import 'package:firebase_database/firebase_database.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/user_realtime_database_model.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/realtime_database_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/send_coin_error.dart';

class RealtimeDatabaseDataSourceImpl implements RealtimeDatabaseDataSource {

  final DatabaseReference _userRef = FirebaseDatabase.instance.ref().child('user');

  @override
  Future<void>  addUser(UserRealtimeDatabaseModel user) async {
  try {
     await _userRef.child(user.uid).set(user.toJson());
  } catch (err) {
    return Future.error(err);
  }
  }

  @override
  Future<void> addCoin(String uid , double coin) async {
    try {
       final snapshot = await _userRef.child(uid).child('coin').get();

       if(snapshot.exists) {
         var coinValue = snapshot.value;
         if(coinValue is int) {
           coinValue= coinValue.toDouble() +coin;
         } else if(coinValue is double){
           coinValue= coinValue +coin;
         }

         await _userRef.child(uid).update({'coin' : coinValue});
       }
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Future<void> subtractCoin(String uid , double coin) async {
    try {
      final snapshot = await _userRef.child(uid).child('coin').get();

      if(snapshot.exists) {
        var coinValue = snapshot.value;
        if(coinValue is int) {
          coinValue= coinValue.toDouble() -coin;
        } else if(coinValue is double){
          coinValue= coinValue -coin;
        }

        await _userRef.child(uid).update({'coin' : coinValue});
      }
    } catch (err) {
      return Future.error(err);
    }
  }


  Future<bool> _checkReceiverCoin(String uid) async {
    try {
      final receiverRef = _userRef.child(uid);
      final snapshot = await receiverRef.get();

      if (!snapshot.exists) {
        return false;
      }
      return true;
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Future<void> sendCoin(String senderUid, String receiverUid, double amountCoin) async{
    try{
      final snapshot = await _userRef.child(senderUid).child('coin').get();
      if(snapshot.exists) {

        final receiverValid = await  _checkReceiverCoin(receiverUid);
        if(receiverValid) {
          await subtractCoin(senderUid, amountCoin);
          await addCoin(receiverUid, amountCoin);
        } else {
          final sendError = SendCoinError("Wallet adress not Valid");
          return Future.error(sendError);
        }
      }
    } catch(err) {
      return Future.error(err);
    }
  }
  //  listen coin change
  @override
  Stream<double> listenToCoinChanges(String uid)  {
    return _userRef.child(uid).child('coin').onValue.map((event) {
      final newAmountCoin = event.snapshot.value;
      if(newAmountCoin is int ){
        return newAmountCoin.toDouble();
      } else if(newAmountCoin is double ) {
        return newAmountCoin;
      } else {
        return 0.0 ;
      }
    });
  }

  // delete User
  @override
  Future<void> deleteUser(String uid) async {
    try {
      await _userRef.child(uid).remove();
    } catch (err) {
      return Future.error(err);
    }
  }
}