import 'package:isar/isar.dart';

part 'result_local.g.dart';

@Collection()
class ResultLocal {
  Id id = Isar.autoIncrement;
  late String idResult;
  late int total;
  late double completion;
  late int correct;
  late int wrong;
  late double coin;

  ResultLocal(
      {required this.idResult,
      required this.total,
      required this.completion,
      required this.correct,
      required this.wrong,
      required this.coin});
}
