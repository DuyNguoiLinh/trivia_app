import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/user_realtime_database_model.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/firestore_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/realtime_database_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../model/firebase_model/user_firestore_model.dart';
import '../sources/auth_data_source.dart';
import '../sources/user_local_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final _quizDataSource = QuizRepository.create();
  final _localDataSource = UserLocalDataSource.create();

  ///firebase
  final _authDataSource = AuthDataSource.create();
  final _firestoreDataSource = FirestoreDataSource.create();
  final _realtimeDatabase = RealtimeDatabaseDataSource.create();

  // Sign up
  @override
  Future<void> signUp(String email, String passWord, String userName) async {
    final user = await _authDataSource.signUpUser(email, passWord, userName);

    if (user != null) {
      // add user to firestore
      final userResponse = UserFirestoreModel(uid: user.uid, name: userName);
      final userRealtime = UserRealtimeDatabaseModel(uid: user.uid, name: userName, email: email);
      _firestoreDataSource.addUser(userResponse);
      _realtimeDatabase.addUser(userRealtime);
      // save user to local
      saveUserName(userName, 0, user.uid);
    }
  }

  //Sign in and get user to firestore
  @override
  Future<void> login(String email, String passWord) async {
    final user = await _authDataSource.signInUser(email, passWord);

    if (user != null) {
      final userResponse = await _firestoreDataSource.getUserByUid(user.uid);

      if (userResponse != null) {
        await saveUserName(
            userResponse.name, userResponse.coin, userResponse.uid);
      }
    }
  }

  // Sign out
  @override
  Future<void> signOut(String uid) async {
    await _authDataSource.signOut();
    await _localDataSource.deleteLocalData(uid);
  }

  // sign in with google
  @override
  Future<void> signInWithGoogle() async {
    try {
      final user = await _authDataSource.signInWithGoogle();

      if (user != null) {
        final userResponse = await _firestoreDataSource.getUserByUid(user.uid);

        if (userResponse != null) {
         await saveUserName(userResponse.name, userResponse.coin, userResponse.uid);

        } else {
          final name = user.displayName;
          if (name != null) {
            // push user to firestore
            final userResponse = UserFirestoreModel(uid: user.uid, name: name);
            _firestoreDataSource.addUser(userResponse);

            final userRealtime = UserRealtimeDatabaseModel(uid: user.uid, name: name, email: user.email!);
            _realtimeDatabase.addUser(userRealtime);

            await saveUserName(name, 0, user.uid);
          }
        }
      }
    } catch (err) {
      return Future.error(err);
    }

  }

  // Connect google account
  @override
  Future<void> linkGoogleAccount() async {
    await _authDataSource.linkGoogleAccount();
  }

  //  delete account
  @override
  Future<void> deleteAccount(String uid) async {
    await _firestoreDataSource.deleteUserData(uid);
    await _realtimeDatabase.deleteUser(uid);
    await _localDataSource.deleteLocalData(uid);
    await _authDataSource.deleteAccount(uid);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _authDataSource.sendPasswordResetEmail(email);
  }

  //  ****Fire Store ******


  //  Fetch user
  @override
  Future<List<UserEntity>> fetchUserSortedByCoin(
      int pageIndex, int pageSize) async {
    final listUser =
        await _firestoreDataSource.getTopUser(pageIndex, pageSize);
    return listUser.map((e) => UserEntity.fromFirestore(e)).toList();
  }

  // get info user to fire store
  @override
  Future<UserEntity> getUser(String uid) async {
    try {
      final userLocal = await _localDataSource.getUser(uid);
      final userInfo = UserEntity.fromLocal(userLocal!);
      return userInfo;
    } catch (err) {
      return Future.error(err);
    }
  }

  //  send coin
  @override
  Future<void> sendCoin(String senderUid, String receiverUid, double amountCoin) async {
    try {
      await _realtimeDatabase.sendCoin(senderUid, receiverUid, amountCoin);

     await addCoin(amountCoin, receiverUid,gift: true);
     await subtractCoin(amountCoin, senderUid,gift: true);

    } catch (err) {
      return Future.error(err);
    }
  }
  //  stream update coin Ui
  @override
  Stream<double> listenToCoinChanges(String uid) {
    return _realtimeDatabase.listenToCoinChanges(uid);
  }
  // ****Local******

  // save user name
  @override
  Future<void> saveUserName(String name, double coin, String uid) async {
    await _localDataSource.saveUserName(name, coin, uid);
    final coinHistoryFromFirestore =
        await _firestoreDataSource.fetchCoinHistories(uid);
    final coinHistoryLocal = coinHistoryFromFirestore
        .map((e) => CoinHistoryEntity.fromFirestore(e).toLocal())
        .toList();
    await _localDataSource.saveCoinHistories(coinHistoryLocal, uid);
  }

  // change user name
  @override
  Future<void> changeUserName(String uid, String name) async {
    await _firestoreDataSource.changeName(uid, name);
    await _localDataSource.changeUserName(uid, name);
  }

  // updated coin

  @override
  Future<void>  updatedCoin(String uid , double newAmountCoin) async {
    await _localDataSource.updatedCoin(uid, newAmountCoin);
  }

  // update coin
  @override
  Stream<UserEntity> getInfoUser(String uid) {
    return _localDataSource.getInfoUser(uid).map((userLocal) {
      return userLocal.map((user) => UserEntity.fromLocal(user)).toList().first;
    });
  }


  //  delete info user in local
  @override
  Future<void> deleteInfo() async {
    try {
      await _localDataSource.deleteInfoUser();
    } catch (err) {
      return Future.error(err);
    }
  }

  //   addition  coin
  @override
  Future<void> addCoin(double coin, String uid,{bool gift=false}) async {
    try {
      final coinHistoryEntity = CoinHistoryEntity(
        amountEarnCoin: coin,
        timestamp: DateTime.now(),
        type: gift == true ? 'earn-gift' : 'earn',
      );


      await _firestoreDataSource.addCoin(uid, coin, coinHistoryEntity.toFireStore());

      if(!gift){
        await _localDataSource.addCoin(coin, uid, coinHistoryEntity.toLocal());
        await _realtimeDatabase.addCoin(uid, coin);
      }


    } catch (err) {
      return Future.error(err);
    }
  }

  // subtraction coin
  @override
  Future<void> subtractCoin(double coin, String uid,{bool gift=false}) async {
    try {
      final coinHistoryEntity = CoinHistoryEntity(
        amountEarnCoin: coin,
        timestamp: DateTime.now(),
        type: gift == true ? 'fee-gift' : 'fee',
      );

      await _localDataSource.subtractionCoin(
          coin, uid, coinHistoryEntity.toLocal());


      await _firestoreDataSource.subtractCoin(uid, coin, coinHistoryEntity.toFireStore());
      if(!gift){
        await _realtimeDatabase.subtractCoin(uid, coin);
      }

    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Stream<List<CoinHistoryEntity>> watchCoinHistoryLocal(int pageIndex) {
    return _localDataSource
        .watchCoinHistoryInThirtyDays(pageIndex)
        .map((listCoinHistory) {
      return listCoinHistory
          .map((e) => CoinHistoryEntity.fromLocal(e))
          .toList();
    });
  }

  //  get coin history
  @override
  Future<List<CoinHistoryEntity>> getCoinHistories(
      int pageIndex, int pageSize, String uid) async {
    try {
      final coinHistoriesLocal =
          await _localDataSource.getCoinHistories(pageIndex, pageSize, uid);
      final coinHistories = coinHistoriesLocal
          .map((e) => CoinHistoryEntity.fromLocal(e))
          .toList();
      return coinHistories;
    } catch (err) {
      return Future.error(err);
    }
  }

  // delete CoinHistory
  @override
  Future<void> deleteCoinHistory(String idTransaction, String uid) async {
    try {
      await _firestoreDataSource.deleteCoinTransaction(uid, idTransaction);
      await _localDataSource.deleteCoinHistory(idTransaction);
    } catch (err) {
      return Future.error(err);
    }
  }
}
