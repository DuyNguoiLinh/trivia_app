import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/result_widget/action_button.dart';

class ListAction extends ConsumerWidget {
  const ListAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.purpleAccent,
      ),
      child: const Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButton(nameAction: 'Play again',),
              ActionButton(nameAction: 'Review Answer',),
              ActionButton(nameAction: 'Share',),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 20,),
              ActionButton(nameAction: 'Screenshot',),
              Spacer(),
              ActionButton(nameAction: 'Home',),
              Spacer(),
              ActionButton(nameAction: 'Feedback',),
              SizedBox(width: 18,),
            ],
          )
        ],
      ),
    );
  }
}
