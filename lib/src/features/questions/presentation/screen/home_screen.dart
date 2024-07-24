import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/bottom_navigationbar.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/filters.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/list_categories.dart';

import '../widget/home_widget/draw.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Coin')),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/logo1.png'),
              iconSize: 50,
            ),
          )
        ],
      ),
      drawer: const Draw(),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, \$UserName',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text("Lets test your knowledge",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 100),
              child: const Text(
                'Pick a Quiz Category',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(
                  height: 3,
                  color: Colors.grey,
                )),
            const Filters(),
            const SizedBox(height: 10,),
            const Expanded(child: ListCategories())
          ],
        ),
          bottomNavigationBar: const QuizBottomNavigationBar(),

    );
  }
}
