import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../message/presentation/screen/Setting_screen.dart';
import '../widget/home_widget/home.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '555',
                style: TextStyle(fontSize: 30, color : Colors.white,fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8,
              ),
              Image.asset(
                'assets/images/bitcoin.png',
                width: 34,
                height: 34,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).push('/setting');
                // Navigator.push(context, createPopRoute());
              },
              child: const Text(
                'Setting',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
          ],
        ),
        body: Home()
        );
  }
}
