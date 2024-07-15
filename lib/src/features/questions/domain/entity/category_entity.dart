import 'package:flutter/foundation.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/category_local.dart';
import '../../data/models/category_model.dart';

class CategoryEntity {
  final int id;
  String nameCategory;
  String filterCategory;
  CategoryEntity({required this.id,required this.nameCategory,required this.filterCategory});
  factory CategoryEntity.fromCategoryResponse(CategoryModel category) {
    if(category.name.contains('Entertainment') == true) {
      return CategoryEntity(id: category.id, nameCategory: category.name.replaceAll('Entertainment: ', ''),filterCategory: 'entertainment');
    }
    if(category.name.contains('Science') == true) {
      return CategoryEntity(id: category.id, nameCategory: category.name.replaceAll('Science: ', ''),filterCategory: 'science');
    } else {
      return CategoryEntity(id: category.id, nameCategory: category.name,filterCategory: 'popular');
    }

  }
  factory CategoryEntity.fromCategoryLocal(CategoryLocal category) {
    return CategoryEntity(id: category.idCategory, nameCategory: category.nameCategory,filterCategory: category.filterCategory);
  }
}