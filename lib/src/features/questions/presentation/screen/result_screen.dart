import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/result_widget/details_result.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/result_widget/list_action.dart';
import '../controller/result_controller/data_result_controller.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(dataResultProvider);

    return Scaffold(
      body: asyncData.when(
        data: (dataResult) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DetailsResult(resultEntity: dataResult),
              const SizedBox(height: 10),
              const Expanded(child: ListAction()),
            ],
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error, stack) {
          return Center(
            child: Text('Error: $error'),
          );
        },
      ),
    );
  }

}