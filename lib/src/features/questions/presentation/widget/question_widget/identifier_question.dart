import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/identifier_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller.dart';

class IdentifierQuestion extends ConsumerWidget {
  const IdentifierQuestion({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncIndex=ref.watch(asyncIdentifierProvider);
    final index=asyncIndex.maybeMap(data: (data) => data.value ,orElse: () => 0);
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          backgroundColor: index == id ? Colors.white : Colors.white12 ,   //54
          side: const BorderSide(color: Colors.black38, width: 2)
      ),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: Text(
          id.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}