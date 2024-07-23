import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ResultEntity {

  ResultEntity(
      {required this.total,
      required this.completion,
      required this.correct,
      required this.wrong,
      required this.coin})
      : id = uuid.v4();

  final String id;
  final int total;
  final double completion;
  final int correct;
  final int wrong;
  final double coin;
}
