import 'package:isar/isar.dart';
part 'coin_history_local.g.dart';


@Collection()
class CoinHistoryLocal {

  Id id = Isar.autoIncrement;
  @Index(unique: true)
  final String idTransaction;
  final String? message;
  late double amountEarnCoin;
  late DateTime timestamp;
  late String type;

  CoinHistoryLocal({
    required this.idTransaction ,
    this.message,
    required this.amountEarnCoin,
    required this.timestamp,
    required this.type
  });

}