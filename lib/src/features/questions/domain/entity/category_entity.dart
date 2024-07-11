import 'package:flutter/foundation.dart';
import '../../data/models/category_model.dart';

class CategoryEntity {
  final int id;
  final String nameCategory;
  CategoryEntity({required this.id,required this.nameCategory});
  factory CategoryEntity.fromCategoryResponse(CategoryModel category) {
    return CategoryEntity(id: category.id, nameCategory: category.name);
  }
}