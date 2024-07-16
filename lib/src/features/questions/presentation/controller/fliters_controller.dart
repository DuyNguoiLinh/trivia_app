import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/category_controller.dart';

enum ListFilter { popular, entertainment, science }

final filtersProvider = StateProvider<ListFilter>((ref) => ListFilter.popular);
// Category provider
final categoryFilterProvider = Provider<List<CategoryEntity>>((ref) {
  final filter = ref.watch(filtersProvider);
  final asyncCategories = ref.watch(categoryProvider);

  final listCategory = asyncCategories.maybeMap(
      data: (asyncData) => asyncData.value,
      orElse: () => List<CategoryEntity>.empty());

  if (listCategory.isNotEmpty) {
    // list entertainment category
    // final entertainmentCategory = listCategory
    //     .where((e) => e.filterCategory=='entertainment').toList();
    //  list science Category
    // final scienceCategory = listCategory.where((e) => e.filterCategory=='science').toList();
    // list popular Category
    // final popularCategory = listCategory
    //       .where((e) => e.filterCategory=='popular').toList();
      switch (filter) {
        case ListFilter.popular:
          final popularCategory = listCategory
              .where((e) => e.filterCategory=='popular').toList();
          return popularCategory;
          break;
        case ListFilter.entertainment:
          final entertainmentCategory = listCategory
              .where((e) => e.filterCategory=='entertainment').toList();
          return entertainmentCategory;
          break;
        case ListFilter.science:
          final scienceCategory = listCategory.where((e) => e.filterCategory=='science').toList();
          return scienceCategory;
          break;
      }
    } else {
return List.empty();
}
});
