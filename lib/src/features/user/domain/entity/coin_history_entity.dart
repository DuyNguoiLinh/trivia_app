import 'package:trivia_app_with_flutter/src/features/user/data/model/coin_history_local.dart';

class CoinHistoryEntity {

  final int id;
  final double oldAmount;
  final double amountEarnCoin;
  final DateTime timestamp;
  final String type;

  CoinHistoryEntity({
    required this.id,
    required this.oldAmount,
    required this.amountEarnCoin,
    required this.timestamp,
    required this.type
  });

  factory CoinHistoryEntity.fromLocal(CoinHistoryLocal coinHistoryLocal) {
    return CoinHistoryEntity(
      id: coinHistoryLocal.id,
      oldAmount: coinHistoryLocal.oldAmount,
      amountEarnCoin: coinHistoryLocal.amountEarnCoin,
      timestamp: coinHistoryLocal.timestamp,
      type: coinHistoryLocal.type,);
  }
}