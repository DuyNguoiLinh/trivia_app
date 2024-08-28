import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/home_controller/filters_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/button_filter.dart';

class Filters extends ConsumerWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameFilter =ref.watch(filtersProvider);
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child:  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [

            ButtonFilter(nameFilter: 'Popular', onPressed: () {
              ref.read(filtersProvider.notifier).state = ListFilter.popular;
            },),

            const SizedBox(width: 20,),

            ButtonFilter(nameFilter: 'Entertainment', onPressed: () {
              ref.read(filtersProvider.notifier).state = ListFilter.entertainment;
            },),

            const SizedBox(width: 20,),

            ButtonFilter(nameFilter: 'Science', onPressed: () {
              ref.read(filtersProvider.notifier).state = ListFilter.science;
            },),
          ],
        ),
      ),
    );
  }

}