import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/fliters_controller.dart';

class Filters extends ConsumerWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child:  Row(
        children: [
          TextButton(
            onPressed: () {
              ref.read(filtersProvider.notifier).state = ListFilter.popular;
            },
            child: const Text('Popular', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ),
          const SizedBox(width: 20,),
          TextButton(
            onPressed: () {
              ref.read(filtersProvider.notifier).state = ListFilter.entertainment;
            },
            child: const Text('Entertainment', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          ),
          const SizedBox(width: 15,),
          TextButton(
            onPressed: () {
              ref.read(filtersProvider.notifier).state = ListFilter.science;
            },
            child: const Text('Science', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          ),
        ],
      ),
    );
  }

}