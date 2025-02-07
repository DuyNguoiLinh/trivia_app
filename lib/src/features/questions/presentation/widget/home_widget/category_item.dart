import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/home_controller/category_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/option_controller/parametter_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/option_screen.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/router_controller.dart';

class CategoryItem extends ConsumerWidget {
  const CategoryItem({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapOptions = ref.watch(parameterProvider);
    final mapIcon = ref.watch(iconCategoryProvider);
    final iconCategory = mapIcon[categoryEntity.id] ?? "assets/icons/book.png";
    final isPickOption = (mapOptions['idCategory'] == categoryEntity.id);


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blueGrey.withOpacity(0.1) ,
            foregroundColor:  Colors.white,
            side: const BorderSide(width: 2.0, color: Colors.blueAccent),
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            // get id ,name category
            ref.read(idCategoryProvider.notifier).state = categoryEntity.id;
            ref.read(nameCategoryProvider.notifier).state =
                categoryEntity.nameCategory;

            //  add id Category
            ref
                .read(parameterProvider.notifier)
                .addParameter('idCategory', categoryEntity.id);

            GoRouter.of(context).push('/options');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                iconCategory,
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 60,
              ),
              Expanded(
                  child: Text(
                categoryEntity.nameCategory.toString(),
                style: const TextStyle(
                  fontSize: 22,
                ),
              ))
            ],
          )),
    );
  }
}
