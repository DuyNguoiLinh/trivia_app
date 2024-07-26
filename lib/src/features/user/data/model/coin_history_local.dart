import 'package:isar/isar.dart';
part 'coin_history_local.g.dart';
@Collection()
class CoinHistoryLocal {

  Id id = Isar.autoIncrement;
  late double oldAmount;
  late double amountEarnCoin;
  late DateTime timestamp;


  CoinHistoryLocal({
    required this.oldAmount,
    required this.amountEarnCoin,
    required this.timestamp,
  });
}