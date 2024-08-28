import 'package:firebase_database/firebase_database.dart';

class CoinRealtimeDatabaseModel {
  final String uidSender;
  final double coin;
  final int ts;


  CoinRealtimeDatabaseModel({
    required this.uidSender,
    required this.coin,
    required this.ts,
  });

  factory CoinRealtimeDatabaseModel.fromJson(Map<String, dynamic> json) {
    return CoinRealtimeDatabaseModel(
      uidSender: json['uidSender'] as String,
      coin: (json['coin'] as num).toDouble(),
      ts: (json['ts'] as num).toInt() ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uidSender': uidSender,
      'coin': coin,
      'ts' : ts,
    };
  }
}
