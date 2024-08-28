import 'package:trivia_app_with_flutter/src/features/user/data/model/coin_history_local.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/coin_history_firestore_model.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class CoinHistoryEntity {
  final String idTransaction;
  final String? message;
  final double amountEarnCoin;
  final DateTime timestamp;
  final String type;

  CoinHistoryEntity({
    required this.amountEarnCoin,
    this.message='',
    required this.timestamp,
    required this.type,
  }) : idTransaction = uuid.v4();

  CoinHistoryEntity.from({
    required this.idTransaction,
    this.message='',
    required this.amountEarnCoin,
    required this.timestamp,
    required this.type,
  });

  factory CoinHistoryEntity.fromLocal(CoinHistoryLocal coinHistoryLocal) {
    return CoinHistoryEntity.from(
      idTransaction: coinHistoryLocal.idTransaction,
      message: coinHistoryLocal.message,
      amountEarnCoin: coinHistoryLocal.amountEarnCoin,
      timestamp: coinHistoryLocal.timestamp,
      type: coinHistoryLocal.type,
    );
  }

  factory CoinHistoryEntity.fromFirestore(
      CoinHistoryFirestoreModel coinHistoryFireStore) {
    return CoinHistoryEntity.from(
      idTransaction: coinHistoryFireStore.idTransaction,
      message: coinHistoryFireStore.message,
      amountEarnCoin: coinHistoryFireStore.amountEarnCoin,
      timestamp: coinHistoryFireStore.timestamp,
      type: coinHistoryFireStore.type,
    );
  }

  CoinHistoryLocal toLocal() {
    return CoinHistoryLocal(
      idTransaction: idTransaction,
      message: message,
      amountEarnCoin: amountEarnCoin,
      timestamp: timestamp,
      type: type,
    );
  }

  CoinHistoryFirestoreModel toFireStore() {
    return CoinHistoryFirestoreModel(
      idTransaction: idTransaction,
      message: message,
      amountEarnCoin: amountEarnCoin,
      timestamp: timestamp,
      type: type,
    );
  }
}
