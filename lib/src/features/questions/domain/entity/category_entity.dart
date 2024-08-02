import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import '../../data/models/local/category_local.dart';
import '../../data/models/remote/category_response.dart';

class CategoryEntity {

  final int id;
  final String nameCategory;
  final String filterCategory;
  List<QuestionEntity>? listQuestion;

  CategoryEntity(
      {required this.id,
      required this.nameCategory,
      required this.filterCategory,this.listQuestion});

  factory CategoryEntity.fromCategoryResponse(CategoryResponse category) {

    if (category.name.contains('Entertainment') == true) {

      return CategoryEntity(
          id: category.id,
          nameCategory: category.name.replaceAll('Entertainment: ', ''),
          filterCategory: 'entertainment');

    }

    if (category.name.contains('Science') == true) {

      return CategoryEntity(
          id: category.id,
          nameCategory: category.name.replaceAll('Science: ', ''),
          filterCategory: 'science');

    } else {

      return CategoryEntity(
          id: category.id,
          nameCategory: category.name,
          filterCategory: 'popular');
    }
  }

  factory CategoryEntity.fromCategoryLocal(CategoryLocal category) {

    return CategoryEntity(

        id: category.idCategory,
        nameCategory: category.nameCategory,
        filterCategory: category.filterCategory,
        listQuestion: category.questions.map((e) => QuestionEntity.fromQuestionLocal(e)).toList(),
    );
  }
}
