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

  // ****Local ****
  Stream<UserEntity> getInfoUser(String uid);

  Future<void> saveUserName(String name, double coin, String uid);

  Future<void> changeUserName(String uid, String name);

  Future<UserEntity> getUser(String uid);

  Future<void> deleteInfo();

  Future<void> addCoin(double coin, String uid);

  Future<void> subtractionCoin(double coin, String uid);

  Stream<List<CoinHistoryEntity>> watchCoinHistoryLocal(int pageIndex);

  Future<List<CoinHistoryEntity>> getCoinHistories(
      int pageIndex, int pageSize, String uid);

  Future<void> deleteCoinHistory(String idTranSaction,String uid);

  factory UserRepository.create() {
    return UserRepositoryImpl();
  }
}
