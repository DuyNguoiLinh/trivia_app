import 'package:image_picker/image_picker.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/coin_realtime_database_model.dart';

import '../../../questions/domain/entity/question_entity.dart';
import '../../data/model/firebase_model/coin_history_firestore_model.dart';
import '../../data/model/firebase_model/question_firestore_model.dart';
import '../../data/repository/user_repository_impl.dart';
import '../entity/coin_history_entity.dart';
import '../entity/user_entity.dart';

abstract class UserRepository {

  //  ****firebase auth*****
  Future<void> signUp(String email, String passWord, String userName);

  Future<void> login(String email, String passWord);

  Future<void> signOut(String uid);

  Future<void> signInWithGoogle();

  Future<void> linkGoogleAccount();

  Future<void> deleteAccount(String uid);

  Future<void> sendPasswordResetEmail(String email);

  // **** firestore *****

  Future<List<UserEntity>> fetchUserSortedByCoin(
      int pageIndex, int pageSize);

  Future<void> sendCoin(String senderUid, String receiverUid, double amountCoin,String message);

  Stream<CoinRealtimeDatabaseModel?> listenToCoinChanges(String uid,int now);

  Stream<List<CoinHistoryEntity>> streamCoinHistories(String uid);

  Future<String?> getUserNameByUid(String uid);

  Future<void>  uploadAvatar(XFile pickerFile,String uid);

  Future<void>  changeAvatar(XFile newPickerFile, String currentAvatarUrl,String uid );

  // ****Local ****
  Stream<UserEntity> watchInfoUser(String uid);

  Future<void> saveUserInfo(String name, double coin, String uid,String? avatarUrl);

  Future<void> changeUserName(String uid, String name);

  Future<void>  updatedCoin(String uid , double newAmountCoin);

  Future<UserEntity?> getUser(String uid);

  Future<void> saveCoinHistories(
      List<CoinHistoryEntity> listCoinHistory, String uid);

  Future<void> deleteInfo();

  Future<void> addCoin(double coin, String uid);

  Future<void> subtractCoin(double coin, String uid);

  Stream<List<CoinHistoryEntity>> watchCoinHistoryInThirtyDays(String uid);

  Future<List<CoinHistoryEntity>> getCoinHistories(
      int pageIndex, int pageSize, String uid);

  Future<void> deleteCoinHistory(String idTranSaction,String uid);

  factory UserRepository.create() {
    return UserRepositoryImpl();
  }
}
