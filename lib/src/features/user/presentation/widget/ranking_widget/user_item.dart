import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/screen/info_User_screen.dart';
import 'package:trivia_app_with_flutter/src/features/user/global_variables.dart';

import '../../../../questions/presentation/widget/home_widget/bottom_navigationbar.dart';

class UserItem extends ConsumerWidget {
  const UserItem({super.key, required this.userEntity, required this.index});

  final UserEntity userEntity;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

     String? assetImage;

    if (index == 1) {
      assetImage = 'assets/images/first.png';
    } else if (index == 2) {
      assetImage = 'assets/images/second.png';
    } else if (index == 3) {
      assetImage = 'assets/images/3rd.png';
    }

    final Color backgroundColor;
    if (index == 1) {
      backgroundColor = Colors.green;
    } else if (index == 2) {
      backgroundColor = Colors.grey[500]!;
    } else if (index == 3) {
      backgroundColor = Colors.brown[300]!;
    } else {
      backgroundColor = Colors.white70;
    }

    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: userEntity.uid == uidGlobal ? Colors.blueAccent  : backgroundColor,
        border: Border.all(
          color: userEntity.uid == uidGlobal ? Colors.red : Colors.grey,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color:userEntity.uid == uidGlobal ? Colors.black.withOpacity(0.6) : Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          if(userEntity.uid == uidGlobal) {
            ref.read(isSelect.notifier).state=3;
            GoRouter.of(context).go("/myself");

          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InfoUserScreen(userEntity: userEntity)),
            );
          }

        },
          child: Row(
            children: [
              if (index <= 3 && assetImage != null)
                Image.asset(
                  assetImage,
                  width: 60,
                  height: 60,
                ),
              if (index > 3)
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    index.toString(),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
            const SizedBox(width: 20,),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: userEntity.avatarUrl == null ?  Image.asset('assets/images/user.png') :
                   Image.network(userEntity.avatarUrl!)
            ),
             const SizedBox(width: 20,),
              Expanded(
                child: Text(
                  userEntity.userName,
                  style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Text(
                    userEntity.coin.toString(),
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),

                  Image.asset(
                    'assets/images/bitcoin.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
