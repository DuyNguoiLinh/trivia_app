import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/wallet_controller/list_category_favorite_controller.dart';

import 'category_love_item.dart';

class ListCategoryHasQuestion extends ConsumerWidget {
  const ListCategoryHasQuestion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncCategories= ref.watch(listCategoryLoveProvider);
    final categories=asyncCategories.maybeMap(data: (data) => data.value,orElse: () => List<CategoryEntity>.empty(growable: true));

    return ListView.builder(
          itemCount: categories.length,
          itemBuilder:(context,index) {
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CategoryLoveItem(categoryEntity: categories[index],)
            );
          }
    );
  }

}