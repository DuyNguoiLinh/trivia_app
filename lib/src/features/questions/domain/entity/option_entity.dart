import 'package:uuid/uuid.dart';

const uuid = Uuid();

class OptionEntity {

  OptionEntity(
      {required this.idCategory,
        required this.nameCategory,
        required this.difficulty,
        required this.type,
        required this.amount})
      : id = uuid.v4();

  final String id;
  late int idCategory;
  late String nameCategory;
  late String? difficulty;
  late  String? type;
  late int amount;
}
