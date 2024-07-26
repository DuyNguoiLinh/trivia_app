import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/bottom_navigationbar.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/filters.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/list_categories.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/user_controller.dart';

import '../widget/home_widget/draw.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get info user into local
    final asyncUserName =ref.watch(userProvider);
    final userInfo=asyncUserName.valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              userInfo!.coin.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8,),
            Image.asset(
              'assets/images/bitcoin.png',
              width: 34,
              height: 34,
            ),
          ],
        ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Hello, ',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 5,),
                      Text(userInfo.userName, style: const TextStyle(fontSize: 30,color: Colors.red,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  const Text("Lets test your knowledge",
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
            const Expanded(child: ListCategories())
          ],
        ),
          bottomNavigationBar: const QuizBottomNavigationBar(),

    );
  }
}
