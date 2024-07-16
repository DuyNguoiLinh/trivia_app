import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/parametter_controller.dart';

class ButtonOption extends ConsumerWidget {
  const ButtonOption({super.key, required this.nameOption, required this.typeOption});
  final String nameOption;
  final String typeOption;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapOptions=ref.watch(parameterProvider);
    final isPickOption= (mapOptions[typeOption] == nameOption);
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isPickOption ? Colors.blueAccent : Colors.white,
          foregroundColor: isPickOption ? Colors.white.withOpacity(0.8) : Colors.blueAccent.withOpacity(0.8),
          side: const BorderSide(width: 2.0,color: Colors.blueAccent),
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          ref.read(parameterProvider.notifier).addParameter(typeOption,nameOption);
        },
        child:  Text(nameOption.toString(), style: const TextStyle(fontSize: 20),),
      );


  }

}