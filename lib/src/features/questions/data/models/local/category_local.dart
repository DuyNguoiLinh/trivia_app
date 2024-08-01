import 'package:isar/isar.dart';

part 'category_local.g.dart';
@Collection()
class CategoryLocal{
  Id id=Isar.autoIncrement;
  late int idCategory;
  late String nameCategory;
  late String filterCategory;
  CategoryLocal({
    required this.idCategory,required this.nameCategory,required this.filterCategory
  });
}