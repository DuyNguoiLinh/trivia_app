import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'coin_history_firestore_model.g.dart';



@JsonSerializable()
class CoinHistoryFirestoreModel {
  final String idTransaction;
  final double amountEarnCoin;
  final DateTime timestamp;
  final String type;

  CoinHistoryFirestoreModel({
    required this.idTransaction,
    required this.amountEarnCoin,
    required this.timestamp,
    required this.type,
  });

  factory CoinHistoryFirestoreModel.fromJson(Map<String, dynamic> json) => _$CoinHistoryFirestoreModelFromJson(json);


  Map<String, dynamic> toJson() => _$CoinHistoryFirestoreModelToJson(this);
}
