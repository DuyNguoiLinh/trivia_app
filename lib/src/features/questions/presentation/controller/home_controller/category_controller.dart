import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import '../../../domain/repository/quiz_respository.dart';

final categoryProvider = FutureProvider.autoDispose<List<CategoryEntity>>((ref) async {
  try {
    final quizRepository= QuizRepository.create();
    final  listCategory=await quizRepository.fetchCategories();
    return listCategory;
  } catch (e) {
    throw Exception('Failed to fetch categories: $e');
  }
});

final iconCategoryProvider = Provider.autoDispose<Map<int,String>>((ref) {
  return {
    9 : 'assets/icons/brain.png',
    10 : 'assets/icons/book.png',
    11 : 'assets/icons/film-slate.png',
    12 : 'assets/icons/musical-note.png',
    13 : 'assets/icons/theater.png',
    14 : 'assets/icons/television.png',
    15 : 'assets/icons/game-console.png',
    16 : 'assets/icons/game-console.png',
    17 : 'assets/icons/science.png',
    18 : 'assets/icons/computer.png',
    19 : 'assets/icons/calculating.png',
    20 : 'assets/icons/palette.png',
    21 : 'assets/icons/sports.png',
    22 : 'assets/icons/geography.png',
    23 : 'assets/icons/brain.png',
    24 : 'assets/icons/politics.png',
    25 : 'assets/icons/palette.png',
    26 : 'assets/icons/fame.png',
    27 : 'assets/icons/paw.png',
    28 : 'assets/icons/fleet.png',
    29 : 'assets/icons/comic.png',
    30 : 'assets/icons/gadgets.png',
    31 : 'assets/icons/anime.png',
    32 : 'assets/icons/jester.png',
  };
});