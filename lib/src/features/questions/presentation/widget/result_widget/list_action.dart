import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/result_widget/action_button.dart';
import '../../controller/question_controller/question_controller.dart';
import '../../controller/result_controller/action_controller.dart';
import '../../screen/home_screen.dart';
import '../../screen/review_screen.dart';

class ListAction extends ConsumerWidget {
  const ListAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final notReview=ref.watch(notReviewProvider);

    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.purpleAccent,
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButton(nameAction: 'Play again', onPressed: () {
                if ( notReview) {
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
                                text: '3 ',
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
                                // play again
                                ref.read(questionProvider.notifier).playAgainQuiz();

                                Navigator.pop(context);
                                Navigator.pop(context);

                              },
                              child: const Text('Okay'))
                        ],
                      ));

                }
              },),
              ActionButton(nameAction: 'Review Answer',onPressed: () {
                ref.read(notReviewProvider.notifier).state = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReviewScreen()),
                );
              },),
              ActionButton(nameAction: 'Share',onPressed: () {},),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 20,),
              ActionButton(nameAction: 'Screenshot',onPressed: () {},),
              const Spacer(),
              ActionButton(nameAction: 'Home',onPressed: () {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                      (Route<dynamic> route) => false,
                );

              },),
              const Spacer(),
              ActionButton(nameAction: 'Feedback',onPressed: () {},),
              const SizedBox(width: 18,),
            ],
          )
        ],
      ),
    );
  }
}
