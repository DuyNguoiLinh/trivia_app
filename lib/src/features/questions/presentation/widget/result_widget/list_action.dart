
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/quiz_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/result_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/result_widget/action_button.dart';
import '../../../../user/global_variables.dart';
import '../../controller/question_controller/question_controller.dart';
import '../../controller/result_controller/action_controller.dart';
import '../question_widget/warning_dialog.dart';

class ListAction extends ConsumerWidget {
  const ListAction({super.key,required this.screenshotController});
  final ScreenshotController screenshotController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ScreenshotController screenshotController = ScreenshotController();

    final notReview = ref.watch(notReviewProvider);

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
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButton(
                nameAction: 'Play again',
                onPressed: () {
                  if (notReview) {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: const Text(
                                'Do you want to replay the quiz?',
                                style: TextStyle(fontSize: 16),
                              ),
                              content: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
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

                                      GoRouter.of(context).pop();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.red),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      if (coinGlobal < 3) {
                                        GoRouter.of(context).pop();
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const WarningDialog(
                                                optionName: 'Play again');
                                          },
                                        );
                                      } else {
                                        // play again
                                        ref
                                            .read(questionProvider.notifier)
                                            .playAgainQuiz();

                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Okay'))
                              ],
                            ));
                  }
                },
              ),
              ActionButton(
                nameAction: 'Review Answer',
                onPressed: () {
                  ref.read(notReviewProvider.notifier).state = false;

                  GoRouter.of(context).push("/review");
                },
              ),
              ActionButton(
                nameAction: 'Share',
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 20,
              ),

              ActionButton(
                nameAction: 'Screenshot',
                onPressed: () async {

                  screenshotController
                      .capture(delay: const Duration(milliseconds: 10))
                      .then((capturedImage) async {

                    final result = await ImageGallerySaver.saveImage(capturedImage!);
                        if (result['isSuccess']) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('completed')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('failded')),
                          );
                        }

                    // ShowCapturedWidget(context, capturedImage!);

                  }).catchError((onError) {
                    print(onError);
                  });
                },
              ),
              const Spacer(),
              ActionButton(
                nameAction: 'Home',
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
              ),
              const Spacer(),
              ActionButton(
                nameAction: 'Continue',
                onPressed: () {
                  ref.invalidate(quizProvider);
                  GoRouter.of(context).go('/questions');
                },
              ),
              const SizedBox(
                width: 18,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Future<dynamic> ShowCapturedWidget(
//     BuildContext context, Uint8List capturedImage) {
//   return showDialog(
//     useSafeArea: false,
//     context: context,
//     builder: (context) =>
//         Scaffold(
//           appBar: AppBar(
//             title: Text("Captured widget screenshot"),
//           ),
//           body: Center(child: Image.memory(capturedImage)),
//         ),
//   );
// }