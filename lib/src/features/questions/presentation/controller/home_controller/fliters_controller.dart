import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/home_controller/category_controller.dart';

enum ListFilter { popular, entertainment, science }

// Convert enum to String
extension ListFilterExtension on ListFilter {
  String get name => toString().split('.').last;
}

final filtersProvider =
    StateProvider.autoDispose<ListFilter>((ref) => ListFilter.popular);

// Is pick Filter
final isPickFilters = Provider.family.autoDispose<bool, String>((ref, name) {

  final filter = ref.watch(filtersProvider);

  if (filter.name.toString().toUpperCase() == name.toUpperCase()) {
    return true;
  }
  return false;
});

// Category provider
final categoryFilterProvider =
    Provider.autoDispose<List<CategoryEntity>>((ref) {

  final filter = ref.watch(filtersProvider);

  final asyncCategories = ref.watch(categoryProvider);

  final listCategory = asyncCategories.maybeMap(
      data: (asyncData) => asyncData.value,
      orElse: () => List<CategoryEntity>.empty());

  if (listCategory.isNotEmpty) {

    switch (filter) {

      case ListFilter.popular:
        final popularCategory =
            listCategory.where((e) => e.filterCategory == 'popular').toList();
        return popularCategory;

      case ListFilter.entertainment:
        final entertainmentCategory = listCategory
            .where((e) => e.filterCategory == 'entertainment')
            .toList();
        return entertainmentCategory;

      case ListFilter.science:
        final scienceCategory =
            listCategory.where((e) => e.filterCategory == 'science').toList();
        return scienceCategory;

    }
  } else {
    return List.empty();
  }
});
