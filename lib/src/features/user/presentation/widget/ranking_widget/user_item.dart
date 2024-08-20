import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';

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
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                index.toString(),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
         const SizedBox(width: 60,),
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
    );
  }
}
