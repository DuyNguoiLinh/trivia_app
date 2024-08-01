import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';

class AsyncCategoriesLoveNotifier
    extends AutoDisposeAsyncNotifier<List<CategoryEntity>> {

  List<CategoryEntity> listCategoryLove = List<CategoryEntity>.empty(
      growable: true);
  final quizRepository = QuizRepository.create();

  @override
  FutureOr<List<CategoryEntity>> build() async {
    listCategoryLove = await quizRepository.getCategoryHasQuestion();
    return listCategoryLove;
  }

}

final listCategoryLoveProvider = AsyncNotifierProvider.autoDispose<
    AsyncCategoriesLoveNotifier,
    List<CategoryEntity>>(() => AsyncCategoriesLoveNotifier());