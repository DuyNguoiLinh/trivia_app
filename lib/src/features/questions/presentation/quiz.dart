
import 'package:flutter/material.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/home_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/start_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/list_categories.dart';
class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    // Do something
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {
      //   '/sa': (context) => StartScreen(),
      //   '/home': (context) => const HomeScreen(),
      //   '/option': (context) => OptionScreen(),
      //   '/answer': (context) => QuestionScreen(),
      //   '/result': (context) => ResultScreen(),
      // },
      home: HomeScreen(),
    );
  }
}
