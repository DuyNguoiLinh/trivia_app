import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller/question_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/result_controller/action_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/question_screen.dart';
import '../../screen/home_screen.dart';
import '../../screen/review_screen.dart';

class ActionButton extends ConsumerWidget {
  const ActionButton({super.key, required this.nameAction});

  final String nameAction;

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

            if (nameAction == 'Review Answer') {
               ref.read(notReviewProvider.notifier).state = false;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReviewScreen()),
              );
            }

            if (nameAction == 'Play again' && notReview) {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Do you want to replay the quiz?', style: TextStyle(fontSize: 16),),
                    content: RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        children: [
                          const TextSpan(text: 'You need to pay  '),
                          const TextSpan(
                            text: '2 ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.red,
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Image.asset(
                              'assets/images/bitcoin.png',
                              width: 30,
                              height: 40,
                            ),
                          ),
                          const TextSpan(text: '  to play again'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // play again
                            ref.read(questionProvider.notifier).playAgainQuiz();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const QuestionScreen()),
                            );
                          },
                          child: const Text('Okay'))
                    ],
                  ));

            }

            if (nameAction == "Home") {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false,
                // (Route<dynamic> route) => route.isFirst,
              );
            }

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
