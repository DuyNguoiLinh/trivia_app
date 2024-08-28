// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_history_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinHistoryFirestoreModel _$CoinHistoryFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    CoinHistoryFirestoreModel(
      idTransaction: json['idTransaction'] as String,
      message: json['message'] as String?,
      amountEarnCoin: (json['amountEarnCoin'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: json['type'] as String,
    );

Map<String, dynamic> _$CoinHistoryFirestoreModelToJson(
        CoinHistoryFirestoreModel instance) =>
    <String, dynamic>{
      'idTransaction': instance.idTransaction,
      'message': instance.message,
      'amountEarnCoin': instance.amountEarnCoin,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': instance.type,
    };
