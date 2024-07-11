
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/category_future_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/category_item.dart';

class ListCategories extends ConsumerWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final listCategoriesResponse=ref.watch(categoryProvider);
     final categories=listCategoriesResponse.maybeMap(data: (asyncData) => asyncData.value,
           orElse: () => List<CategoryEntity>.empty(),);
       return Scaffold(
         body: ListView.builder(
             itemCount: categories.length,
             itemBuilder:(context,index) {
               return Padding(
                   padding: const EdgeInsets.symmetric(vertical: 10),
                   child: CategoryItem(categoryEntity: categories[index],)
               );
             }
         ),
       );
  }

}