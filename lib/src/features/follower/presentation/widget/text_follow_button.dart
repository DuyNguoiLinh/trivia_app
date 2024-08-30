import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/controller/amount_follower_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import '../controller/follower_controller.dart';
import '../screen/list_follower_screen.dart';

class TextFollowButton extends ConsumerWidget {
  const TextFollowButton({super.key,required this.userEntity});

  final UserEntity userEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncAmount = ref.watch(amountFollowerProvider(userEntity.uid));
    final followerEntity = asyncAmount.valueOrNull;

    if (followerEntity != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ListFollowerScreen(
                        userEntity: userEntity, initialIndex: 0,)),
                );
              },
              child: Text(
                'Follow  ${followerEntity.amountFollowing}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              )),

          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ListFollowerScreen(
                        userEntity: userEntity, initialIndex: 1,)),
                );
              },
              child: Text(
                ' ${followerEntity.amountFollower} Follower',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              )),

        ],
      );
    } else {
      return const Center(child: LinearProgressIndicator());

    }
  }
}