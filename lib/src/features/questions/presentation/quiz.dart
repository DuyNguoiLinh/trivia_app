import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/startscreen.dart';
class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    // Do something
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Startscreen(),
    );
  }
}
