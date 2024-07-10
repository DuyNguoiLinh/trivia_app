import 'package:flutter/material.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/buttons.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
             Center(
               child: SizedBox(
                 height: 400,
                 child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/onBoarding1.png'),
                  )),),
               ),
               
             ),
             Buttons(),
        ],
      ),
    ));
  }
}
