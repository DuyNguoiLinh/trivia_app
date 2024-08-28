import 'package:isar/isar.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/local/question_local.dart';
import 'coin_history_local.dart';

part 'user_info_local.g.dart';

@Collection()
class UserInfoLocal {
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  late String userName;
  late double coin;
  @Index(unique: true)
  late String uid;
  late String? avatarUrl;

  final coinHistories = IsarLinks<CoinHistoryLocal>();
  final questions = IsarLinks<QuestionLocal>();

  UserInfoLocal({
    required this.userName,
    this.coin = 0.0,
    required this.uid,
    this.avatarUrl,
  });
}
