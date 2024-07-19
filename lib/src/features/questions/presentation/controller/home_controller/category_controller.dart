import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';

import '../../../domain/respository/quiz_respository.dart';

final categoryProvider = FutureProvider<List<CategoryEntity>>((ref) async {
  try {
    final quizRespository= QuizRespository.create();
    final  listCategory=await quizRespository.fetchCategories();
    return listCategory;
  } catch (e) {
    throw Exception('Failed to fetch categories: $e');
  }
});