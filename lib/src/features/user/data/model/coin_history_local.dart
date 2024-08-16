import 'package:isar/isar.dart';
part 'coin_history_local.g.dart';


@Collection()
class CoinHistoryLocal {

  Id id = Isar.autoIncrement;
  final String idTransaction;
  late double amountEarnCoin;
  late DateTime timestamp;
  late String type;

  CoinHistoryLocal({
    required this.idTransaction ,
    required this.amountEarnCoin,
    required this.timestamp,
    required this.type
  });

}