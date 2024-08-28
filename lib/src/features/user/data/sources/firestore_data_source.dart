import '../model/firebase_model/coin_history_firestore_model.dart';
import '../model/firebase_model/question_firestore_model.dart';
import '../model/firebase_model/user_firestore_model.dart';
import 'firestore_data_source_impl.dart';

abstract class FirestoreDataSource {

  Future<void> addUser(UserFirestoreModel user);

  Future<UserFirestoreModel?> getUserByUid(String uid);

  Future<void> changeAvatar(String uid , String avatarUrl);

  Future<bool> checkReceiverCoin(String uid);

  Future<void> addCoin(String uid, double coinToAdd,CoinHistoryFirestoreModel coinHistory);

  Future<void> subtractCoin(String uid, double coinToSubtract,CoinHistoryFirestoreModel coinHistory);

  Future<void> addQuestionFavorite(QuestionFirestoreModel question,String uid);

  // Future<void> transactionCoin(CoinHistoryFirestoreModel coinHistory,String uid);

  Stream<List<CoinHistoryFirestoreModel>> streamCoinHistories(String uid);

  Future<void> deleteCoinTransaction(String uid, String idTransaction);

  Future<void> deleteQuestionFavorite(String uid, String idQuestion);

  Future<List<UserFirestoreModel>> getTopUser(
      int pageIndex, int pageSize);

  Future<List<CoinHistoryFirestoreModel>> fetchCoinHistories( String uid);

  Future<List<QuestionFirestoreModel>> fetchQuestionFavorite(String uid);

  Future<void> changeName(String uid, String name);

  Future<void> deleteUserData(String uid);

  factory FirestoreDataSource.create() {
    return FirestoreDataSourceImpl();
  }

}