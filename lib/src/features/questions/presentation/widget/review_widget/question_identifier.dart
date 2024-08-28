import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionIdentifier extends ConsumerWidget{
  const QuestionIdentifier({super.key,required this.isTrue,required this.index});

  final bool isTrue;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Container(
    width: 35,
    height: 35,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isTrue
          ? const Color.fromARGB(255, 150, 198, 241)
          : const Color.fromARGB(255, 249, 133, 241),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text( index.toString(),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 22, 2, 56),
      ),
    ),
  );
  }

}