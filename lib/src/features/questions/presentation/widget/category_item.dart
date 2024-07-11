import 'package:flutter/material.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key , required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Column(
        children: [
          Text(categoryEntity.id.toString()),
          Text(categoryEntity.nameCategory.toString()),
        ],
      ),
    );
  }
}
