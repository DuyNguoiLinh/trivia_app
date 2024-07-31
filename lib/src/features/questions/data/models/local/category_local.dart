import 'package:isar/isar.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/local/question_local.dart';

part 'category_local.g.dart';
@Collection()
class CategoryLocal{
  Id id=Isar.autoIncrement;
  late int idCategory;
  late String nameCategory;
  late String filterCategory;
  final questions =IsarLinks<QuestionLocal>();

  CategoryLocal({
    required this.idCategory,required this.nameCategory,required this.filterCategory
  });
}