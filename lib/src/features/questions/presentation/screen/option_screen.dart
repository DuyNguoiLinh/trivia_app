import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/option_widget/list_option.dart';

class OptionScreen extends ConsumerWidget {
  const OptionScreen({super.key,required this.nameCategory});
  final String nameCategory;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return Scaffold(
       appBar:  AppBar(
         title: const Text('Options'),
       ),
       body:  Column(
         children: [
           ListOptions(nameCategory: nameCategory,),
           const SizedBox(height: 20,)
         ],
       ),
     );
  }

}