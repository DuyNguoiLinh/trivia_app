import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/bottom_navigationbar.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/user_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/screen/wallet_screen.dart';
import '../widget/home_widget/draw_setting.dart';
import '../widget/home_widget/home.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // get info user into local
    final asyncUser =ref.watch(userProvider);
    final userInfo =asyncUser.valueOrNull;
    final index =ref.watch(isSelect);

    Widget body;
    switch (index) {
      case 1:
        body = const WalletScreen();
        break;
      case 0:
      default:
        body = const Home();
        break;
    }
    if(userInfo != null){
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userInfo.coin.toString(),
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
        drawer: const DrawSetting(),
        body: body,
        bottomNavigationBar: const QuizBottomNavigationBar(),

      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
