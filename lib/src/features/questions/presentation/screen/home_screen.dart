import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/user_controller.dart';
import '../widget/home_widget/draw_setting.dart';
import '../widget/home_widget/home.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get info user into local

    final asyncUser = ref.watch(userProvider);
    final userInfo = asyncUser.valueOrNull;
    // final index = ref.watch(isSelect);

    if (userInfo != null) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userInfo.coin.toString(),
                style: const TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold),
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
            ClipOval(
              // borderRadius: BorderRadius.circular(30.0),

              child: IconButton(
                onPressed: () {},
                icon: userInfo.avatarUrl == null ?  Image.asset('assets/images/user.png') :
                 Image.network(userInfo.avatarUrl!,
                 loadingBuilder: (context,child,loadingProgress) {
                   if (loadingProgress == null) {
                     return child;
                   } else {
                     return Center(
                       child: CircularProgressIndicator(
                         value: loadingProgress.expectedTotalBytes != null
                             ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                             : null,
                       ),
                     );
                   }
                 },
                 ),
                iconSize: 50,
              ),
            )
          ],
        ),
        drawer: const DrawSetting(),
        body: const Home(),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
