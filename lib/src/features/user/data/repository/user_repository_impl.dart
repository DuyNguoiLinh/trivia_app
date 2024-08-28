import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:ntp/ntp.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/coin_realtime_database_model.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/firestore_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/realtime_database_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/storage_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../model/firebase_model/user_firestore_model.dart';
import '../sources/auth_data_source.dart';
import '../sources/send_coin_error.dart';
import '../sources/user_local_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final _quizDataSource = QuizRepository.create();
  final _localDataSource = UserLocalDataSource.create();

  ///firebase
  final _authDataSource = AuthDataSource.create();
  final _firestoreDataSource = FirestoreDataSource.create();
  final _realtimeDatabase = RealtimeDatabaseDataSource.create();
  final _storageDataSource = StorageDataSource.create();

  // Sign up
  @override
  Future<void> signUp(String email, String passWord, String userName) async {
    final user = await _authDataSource.signUpUser(email, passWord, userName);

    if (user != null) {
      // add user to firestore
      final userResponse = UserFirestoreModel(uid: user.uid, name: userName);

      _firestoreDataSource.addUser(userResponse);
      // save user to local
      await saveUserInfo(userName, 0, user.uid, null);
    }
  }

  //Sign in and get user to firestore
  @override
  Future<void> login(String email, String passWord) async {
    final user = await _authDataSource.signInUser(email, passWord);

    if (user != null) {
      final userResponse = await _firestoreDataSource.getUserByUid(user.uid);

      if (userResponse != null) {
        await saveUserInfo(userResponse.name, userResponse.coin,
            userResponse.uid, userResponse.avatarUrl);
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
          await saveUserInfo(userResponse.name, userResponse.coin, user.uid,
              userResponse.avatarUrl);
        } else {
          final name = user.displayName;
          if (name != null) {
            // push user to firestore
            final userResponse = UserFirestoreModel(uid: user.uid, name: name);
            _firestoreDataSource.addUser(userResponse);

            await saveUserInfo(name, 0, user.uid, null);
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
    final listUser = await _firestoreDataSource.getTopUser(pageIndex, pageSize);
    return listUser.map((e) => UserEntity.fromFirestore(e)).toList();
  }

  // get info user to fire store
  @override
  Future<UserEntity?> getUser(String uid) async {
    try {
      final userFirestore = await _firestoreDataSource.getUserByUid(uid);

      if (userFirestore != null) {
        final userInfo = UserEntity.fromFirestore(userFirestore);

        final coinHistoryLocal = userFirestore.coinHistories
            .map((e) => CoinHistoryEntity.fromFirestore(e).toLocal())
            .toList();

        await _localDataSource.saveUserInfo(
            userInfo.userName, userInfo.coin, uid, userInfo.avatarUrl);
        await _localDataSource.saveCoinHistories(coinHistoryLocal, uid);

        return userInfo;
      }
      return null;
    } catch (err) {
      return Future.error(err);
    }
  }

  // get user name when input wallet address
  @override
  Future<String?> getUserNameByUid(String uid) async {
    try {
      final userFirestore = await _firestoreDataSource.getUserByUid(uid);
      if (userFirestore != null) {
        return userFirestore.name;
      } else {
        return null;
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  //  send coin
  @override
  Future<void> sendCoin(String senderUid, String receiverUid, double amountCoin,
      String message) async {
    try {
      final receiverValid =
          await _firestoreDataSource.checkReceiverCoin(receiverUid);
      if (!receiverValid) {
        final sendError = SendCoinError("Wallet adress not Valid");
        return Future.error(sendError);
      } else {
        final ntpTime = await NTP.now();
        final now = ntpTime.millisecondsSinceEpoch;

        final newCoin = CoinRealtimeDatabaseModel(
          uidSender: senderUid,
          coin: amountCoin,
          ts:  now,
        );
        await _realtimeDatabase.sendCoinRealtime(receiverUid, newCoin);

        await subtractCoin(amountCoin, senderUid, gift: true);
        await addCoin(amountCoin, receiverUid, gift: true, message: message);
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  // upload avatar
  @override
  Future<void> uploadAvatar(XFile pickerFile, String uid) async {
    try {
      final avatarUrl = await _storageDataSource.uploadAvatar(pickerFile);
      await _firestoreDataSource.changeAvatar(uid, avatarUrl);
      await _localDataSource.changeAvatar(uid, avatarUrl);
    } catch (err) {
      return Future.error(err);
    }
  }

  //  change avatar
  @override
  Future<void> changeAvatar(
      XFile newPickerFile, String currentAvatarUrl, String uid) async {
    try {
      final newAvatarUrl = await _storageDataSource.changeAvatar(
          newPickerFile, currentAvatarUrl);
      await _firestoreDataSource.changeAvatar(uid, newAvatarUrl);
    } catch (err) {
      return Future.error(err);
    }
  }

  //****Local****
  // Stream
  @override
  Stream<List<CoinHistoryEntity>> streamCoinHistories(String uid) {
    return _firestoreDataSource.streamCoinHistories(uid).map((coinHistory) {
      return coinHistory
          .map((e) => CoinHistoryEntity.fromFirestore(e))
          .toList();
    });
  }

  //  stream update coin Ui
  @override
  Stream<CoinRealtimeDatabaseModel?> listenToCoinChanges(String uid, int now) {
    return _realtimeDatabase.listenToCoinChanges(uid, now);
  }

  // ****Local******

  // save user name
  @override
  Future<void> saveUserInfo(
    String name,
    double coin,
    String uid,
    String? avatarUrl,
  ) async {
    await _localDataSource.saveUserInfo(name, coin, uid, avatarUrl);

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
    // await _realtimeDatabase.changeName(uid, name);
    await _localDataSource.changeUserName(uid, name);
  }

  // updated coin

  @override
  Future<void> updatedCoin(String uid, double newAmountCoin) async {
    await _localDataSource.updatedCoin(uid, newAmountCoin);
  }

  // update coin
  @override
  Stream<UserEntity> watchInfoUser(String uid) {
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
  Future<void> addCoin(double coin, String uid,
      {bool gift = false, String message = ''}) async {
    try {
      final coinHistoryEntity = CoinHistoryEntity(
        message: message,
        amountEarnCoin: coin,
        timestamp: DateTime.now(),
        type: gift == true ? 'earn-gift' : 'earn',
      );

      if (!gift) {
        await _localDataSource.addCoin(coin, uid, coinHistoryEntity.toLocal());
      }

      await _firestoreDataSource.addCoin(
          uid, coin, coinHistoryEntity.toFireStore());
    } catch (err) {
      return Future.error(err);
    }
  }

  // subtraction coin
  @override
  Future<void> subtractCoin(double coin, String uid,
      {bool gift = false, String message = ''}) async {
    try {
      final coinHistoryEntity = CoinHistoryEntity(
        message: message,
        amountEarnCoin: coin,
        timestamp: DateTime.now(),
        type: gift == true ? 'fee-gift' : 'fee',
      );

      await _localDataSource.subtractCoin(
        coin,
        uid,
        coinHistoryEntity.toLocal(),
      );

      await _firestoreDataSource.subtractCoin(
        uid,
        coin,
        coinHistoryEntity.toFireStore(),
      );
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Stream<List<CoinHistoryEntity>> watchCoinHistoryInThirtyDays(String uid) {
    return _localDataSource
        .watchCoinHistoryInThirtyDays(uid)
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

  @override
  Future<void> saveCoinHistories(
      List<CoinHistoryEntity> listCoinHistory, String uid) async {
    final coinHistoriesLocal = listCoinHistory.map((e) => e.toLocal()).toList();
    await _localDataSource.saveCoinHistories(coinHistoriesLocal, uid);
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
