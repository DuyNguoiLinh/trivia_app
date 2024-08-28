import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/home_controller/filters_controller.dart';

class ButtonFilter extends ConsumerWidget {
  const ButtonFilter({
    super.key,
    required this.nameFilter,
    required this.onPressed,
  });

  final String nameFilter;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isPick=ref.watch(isPickFilters(nameFilter));

    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        nameFilter,
        style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isPick ? Colors.blueAccent : Colors.black38),
      ),
    );
  }
}
