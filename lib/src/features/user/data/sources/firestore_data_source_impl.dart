import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/coin_history_firestore_model.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/question_firestore_model.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/user_firestore_model.dart';
import 'firestore_data_source.dart';

class FirestoreDataSourceImpl implements FirestoreDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addUser(UserFirestoreModel user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toJson());
  }

  // get user by uid
  @override
  Future<UserFirestoreModel?> getUserByUid(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserFirestoreModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  //   update coin
  @override
  Future<void> addCoin(String uid, double coinToAdd,CoinHistoryFirestoreModel coinHistory) async {
    try {
      DocumentReference userDoc = _firestore.collection('users').doc(uid);

      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (snapshot.exists) {

          final currentCoinHistories =
          snapshot.get('coinHistories') as List<dynamic>;
          currentCoinHistories.add(coinHistory.toJson());
          transaction.update(userDoc, {'coinHistories': currentCoinHistories});

          double currentCoin = snapshot.get('coin') ?? 0;
          double newCoinValue = currentCoin + coinToAdd;
          transaction.update(userDoc, {'coin': newCoinValue});
        }
      });
    } catch (err) {
      return Future.error(err);
    }
  }

  // Subtract coin
  @override
  Future<void> subtractCoin(String uid, double coinToSubtract,CoinHistoryFirestoreModel coinHistory) async {
    try {
      DocumentReference userDoc = _firestore.collection('users').doc(uid);

      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (snapshot.exists) {
          final currentCoinHistories =
          snapshot.get('coinHistories') as List<dynamic>;
          currentCoinHistories.add(coinHistory.toJson());
          transaction.update(userDoc, {'coinHistories': currentCoinHistories});

          double currentCoin = snapshot.get('coin') ?? 0;
          double newCoinValue = currentCoin -coinToSubtract;

          transaction.update(userDoc, {'coin': newCoinValue});
        }
      });
    } catch (err) {
      return Future.error(err);
    }
  }

  // add question
  @override
  Future<void> addQuestionFavorite(
      QuestionFirestoreModel question, String uid) async {
    try {
      DocumentReference userDoc = _firestore.collection('users').doc(uid);

      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (snapshot.exists) {
          final currentQuestions =
              snapshot.get('questionsFavorite') as List<dynamic>;

          bool questionExits =
              currentQuestions.any((e) => e['id'] == question.id);
          if (questionExits) {
            currentQuestions.removeWhere((e) => e['id'] == question.id);
          } else {
            currentQuestions.add(question.toJson());
          }
          transaction.update(userDoc, {'questionsFavorite': currentQuestions});
        }
      });
    } catch (err) {
      return Future.error(err);
    }
  }

  // // transaction coin
  // @override
  // Future<void> transactionCoin(
  //     CoinHistoryFirestoreModel coinHistory, String uid) async {
  //   try {
  //     DocumentReference userDoc = _firestore.collection('users').doc(uid);
  //     await _firestore.runTransaction((transaction) async {
  //       DocumentSnapshot snapshot = await transaction.get(userDoc);
  //
  //       if (snapshot.exists) {
  //         final currentCoinHistories =
  //             snapshot.get('coinHistories') as List<dynamic>;
  //         currentCoinHistories.add(coinHistory.toJson());
  //         transaction.update(userDoc, {'coinHistories': currentCoinHistories});
  //       }
  //     });
  //   } catch (err) {
  //     return Future.error(err);
  //   }
  // }

  // delete coin history
  @override
  Future<void> deleteCoinTransaction(String uid, String idTransaction) async {
    try {
      DocumentReference userDoc = _firestore.collection('users').doc(uid);
      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (snapshot.exists) {
          final currentCoinHistories =
              snapshot.get('coinHistories') as List<dynamic>;
          List<dynamic> newCoinHistories = currentCoinHistories
              .where((e) => e['idTransaction'] != idTransaction)
              .toList();
          transaction.update(userDoc, {'coinHistories': newCoinHistories});
        }
      });
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Future<void> deleteQuestionFavorite(String uid, String idQuestion) async {
    try {
      DocumentReference userDoc = _firestore.collection('users').doc(uid);
      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (snapshot.exists) {
          final currentQuestions =
          snapshot.get('questionsFavorite') as List<dynamic>;
          List<dynamic> newQuestions = currentQuestions
              .where((e) => e['id'] != idQuestion)
              .toList();
          transaction.update(userDoc, {'questionsFavorite': newQuestions});
        }
      });
    } catch (err) {
      return Future.error(err);
    }
  }

  // get record coin transaction
  DocumentSnapshot? _lastDocumentSnapshot;

  @override
  Future<List<UserFirestoreModel>> getTopUser(
      int pageIndex, int pageSize) async {
    try {
      Query query = _firestore
          .collection('users')
          .orderBy('coin', descending: true)
          .limit(pageSize);

      if (_lastDocumentSnapshot != null && pageIndex > 0) {
        query = query.startAfterDocument(_lastDocumentSnapshot!);
      }

      QuerySnapshot snapshot = await query.get();

      List<UserFirestoreModel> listUser = snapshot.docs.map((e) {
        return UserFirestoreModel.fromJson(
            e.data() as Map<String, dynamic>);
      }).toList();

      if (snapshot.docs.length < pageSize) {
        _lastDocumentSnapshot = null;
      } else {
        _lastDocumentSnapshot = snapshot.docs.last;
      }

      return listUser;
    } catch (err) {
      return Future.error(err);
    }
  }




  @override
  Future<List<CoinHistoryFirestoreModel>> fetchCoinHistories(String uid) async {
    try {
      List<CoinHistoryFirestoreModel> listCoinHistoryFrom = [];

      DocumentReference userDoc = _firestore.collection('users').doc(uid);
      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (snapshot.exists) {
          DateTime thirtyDaysAgo =
              DateTime.now().subtract(const Duration(days: 30));

          final coinHistories = snapshot.get('coinHistories') as List<dynamic>;
          listCoinHistoryFrom = coinHistories
              .map((e) => CoinHistoryFirestoreModel.fromJson(e))
              .where((e) => e.timestamp.isAfter(thirtyDaysAgo))
              .toList();
        }
      });
      return listCoinHistoryFrom;
    } catch (err) {
      return Future.error(err);
    }
  }

  // fetch question from firestore
  @override
  Future<List<QuestionFirestoreModel>> fetchQuestionFavorite(String uid) async {
    try {
      List<QuestionFirestoreModel> questionsFavorite = [];

      DocumentReference userDoc = _firestore.collection('users').doc(uid);
      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (snapshot.exists) {
          final questions = snapshot.get('questionsFavorite') as List<dynamic>;
          questionsFavorite =
              questions.map((e) => QuestionFirestoreModel.fromJson(e)).toList();
        }
      });
      return questionsFavorite;
    } catch (err) {
      return Future.error(err);
    }
  }


  // change name
  @override
  Future<void> changeName(String uid, String name) async {
    try {
      DocumentReference userDoc = _firestore.collection('users').doc(uid);

      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (snapshot.exists) {
          transaction.update(userDoc, {'name': name});
        }
      });
    } catch (err) {
      return Future.error(err);
    }
  }

  //  delete user data
  @override
  Future<void> deleteUserData(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).delete();
    } catch (err) {
      return Future.error(err);
    }
  }
}
