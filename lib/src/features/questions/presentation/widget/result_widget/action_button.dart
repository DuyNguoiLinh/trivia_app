import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/result_controller/action_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/question_screen.dart';
import '../../screen/home_screen.dart';
import '../../screen/review_screen.dart';

class ActionButton extends ConsumerWidget {
  const ActionButton({super.key, required this.nameAction,required this.onPressed});

  final String nameAction;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool notReview=true;
    if(nameAction == 'Play again'){
      notReview=ref.watch(notReviewProvider);
    }
    //  get icon and color
    final mapIcon = ref.watch(iconActionProvider);
    final mapColor = ref.watch(colorActionProvider);
    final Color colorData = mapColor[nameAction] ?? Colors.black;
    final IconData iconData = mapIcon[nameAction] ?? Icons.help_outline;

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            backgroundColor: colorData, //54
            // side: const BorderSide(color: Colors.black38, width: 2)
          ),
          child: Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              child: Icon(
                iconData,
                size: 33,
                color: nameAction != 'Home' ? ( !notReview ? Colors.white.withOpacity(0.3) : Colors.white ): Colors.black87,
              )),
        ),
        Text(
          nameAction,
          style:  TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: notReview ? Colors.black  : Colors.black.withOpacity(0.3)
          ),
        ),
      ],
    );
  }
}
