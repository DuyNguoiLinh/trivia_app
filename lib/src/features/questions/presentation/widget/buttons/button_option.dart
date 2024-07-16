import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/parametter_controller.dart';

class ButtonOption extends ConsumerWidget {
  const ButtonOption({super.key, required this.nameDifficutly, required this.typeOptions});
  final String nameDifficutly; //
  final String typeOptions;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 2.0,color: Colors.blueAccent),
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          ref.read(parameterProvider.notifier).addParameter(typeOptions,nameDifficutly);
        },
        child:  Text(nameDifficutly.toString(), style: const TextStyle(fontSize: 20),),
      );


  }

}