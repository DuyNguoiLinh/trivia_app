import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/firestore_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../model/firebase_model/user_firestore_model.dart';
import '../sources/auth_data_source.dart';
import '../sources/user_local_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final quizDataSource = QuizRepository.create();
  final localDataSource = UserLocalDataSource.create();

  ///
  final authDataSource = AuthDataSource.create();
  final firestoreDataSource = FirestoreDataSource.create();

  // Sign up
  @override
  Future<void> signUp(String email, String passWord, String userName) async {
    final user = await authDataSource.signUpUser(email, passWord, userName);

    if (user != null) {
      // add user to firestore
      final userResponse = UserFirestoreModel(uid: user.uid, name: userName);
      firestoreDataSource.addUser(userResponse);
      // save user to local
      saveUserName(userName, 0, user.uid);
    }
  }

  //Sign in and get user to firestore
  @override
  Future<void> login(String email, String passWord) async {
    final user = await authDataSource.signInUser(email, passWord);

    if (user != null) {
      final userResponse = await firestoreDataSource.getUserByUid(user.uid);

      if (userResponse != null) {
        await saveUserName(
            userResponse.name, userResponse.coin, userResponse.uid);
      }
    }
  }

  // Sign out
  @override
  Future<void> signOut(String uid) async {
    await authDataSource.signOut();
    await localDataSource.deleteLocalData(uid);
  }

  // sign in with google
  @override
  Future<void> signInWithGoogle() async {
    final user = await authDataSource.signInWithGoogle();

    if (user != null) {
      final userResponse = await firestoreDataSource.getUserByUid(user.uid);

      if (userResponse != null) {
        saveUserName(userResponse.name, userResponse.coin, userResponse.uid);
      } else {
        final name = user.displayName;
        if (name != null) {
          // push user to firestore
          final userResponse = UserFirestoreModel(uid: user.uid, name: name);
          firestoreDataSource.addUser(userResponse);

          await saveUserName(name, 0, user.uid);
        }
      }
    }
  }

  // Connect google account
  @override
  Future<void> linkGoogleAccount() async {
    await authDataSource.linkGoogleAccount();
  }

  //  delete account
  @override
  Future<void> deleteAccount(String uid) async {
    await firestoreDataSource.deleteUserData(uid);
    await localDataSource.deleteLocalData(uid);
    await authDataSource.deleteAccount(uid);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await authDataSource.sendPasswordResetEmail(email);
  }

  //  ****Fire Store ******


  //  Fetch user
  @override
  Future<List<UserEntity>> fetchUserSortedByCoin(
      int pageIndex, int pageSize) async {
    final listUser =
        await firestoreDataSource.fetchUserSortedByCoin(pageIndex, pageSize);
    return listUser.map((e) => UserEntity.fromFirestore(e)).toList();
  }

  // ****Local******

  // save user name
  @override
  Future<void> saveUserName(String name, double coin, String uid) async {
    await localDataSource.saveUserName(name, coin, uid);
    final coinHistoryFromFirestore =
        await firestoreDataSource.fetchCoinHistories(uid);
    final coinHistoryLocal = coinHistoryFromFirestore
        .map((e) => CoinHistoryEntity.fromFirestore(e).toLocal())
        .toList();
    await localDataSource.saveCoinHistories(coinHistoryLocal, uid);
  }

  // change user name
  @override
  Future<void> changeUserName(String uid, String name) async {
    await firestoreDataSource.changeName(uid, name);
    await localDataSource.changeUserName(uid, name);
  }

  // update coin
  @override
  Stream<UserEntity> getInfoUser(String uid) {
    return localDataSource.getInfoUser(uid).map((userLocal) {
      return userLocal.map((user) => UserEntity.fromLocal(user)).toList().first;
    });
  }

  // get info user in local
  @override
  Future<UserEntity> getUser(String uid) async {
    try {
      final userLocal = await localDataSource.getUser(uid);
      final userInfo = UserEntity.fromLocal(userLocal!);
      return userInfo;
    } catch (err) {
      return Future.error(err);
    }
  }

  //  delete info user in local
  @override
  Future<void> deleteInfo() async {
    try {
      await localDataSource.deleteInfoUser();
    } catch (err) {
      return Future.error(err);
    }
  }

  //   addition  coin
  @override
  Future<void> addCoin(double coin, String uid) async {
    try {
      final coinHistoryEntity = CoinHistoryEntity(
        amountEarnCoin: coin,
        timestamp: DateTime.now(),
        type: 'earn',
      );
      await localDataSource.addCoin(coin, uid, coinHistoryEntity.toLocal());

      await firestoreDataSource.transactionCoin(
          coinHistoryEntity.toFireStore(), uid);

      await firestoreDataSource.addCoin(uid, coin);
    } catch (err) {
      return Future.error(err);
    }
  }

  // subtraction coin
  @override
  Future<void> subtractionCoin(double coin, String uid) async {
    try {
      final coinHistoryEntity = CoinHistoryEntity(
        amountEarnCoin: coin,
        timestamp: DateTime.now(),
        type: 'fee',
      );

      await localDataSource.subtractionCoin(
          coin, uid, coinHistoryEntity.toLocal());

      await firestoreDataSource.transactionCoin(
          coinHistoryEntity.toFireStore(), uid);

      await firestoreDataSource.subtractCoin(uid, coin);
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Stream<List<CoinHistoryEntity>> watchCoinHistoryLocal(int pageIndex) {
    return localDataSource
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
          await localDataSource.getCoinHistories(pageIndex, pageSize, uid);
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
      await firestoreDataSource.deleteCoinTransaction(uid, idTransaction);
      await localDataSource.deleteCoinHistory(idTransaction);
    } catch (err) {
      return Future.error(err);
    }
  }
}
