import 'package:isar/isar.dart';
import 'coin_history_local.dart';

part 'user_info_local.g.dart';
@Collection()

class UserInfoLocal{
  Id id=Isar.autoIncrement;
  @Index(unique: true)
  late String userName;
  late double coin;

  final coinHistories = IsarLinks<CoinHistoryLocal>();

  UserInfoLocal({
    required this.userName,this.coin=0.0
});
}