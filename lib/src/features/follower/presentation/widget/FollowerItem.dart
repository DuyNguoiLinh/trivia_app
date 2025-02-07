import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/widget/follow_button.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';

import '../controller/follower_controller.dart';

class FollowerItem extends ConsumerWidget {
  const FollowerItem({super.key,required this.userEntity,required this.type});

  final UserEntity userEntity;
  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  return Container(
    height: 100,
    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 60,
              width: 60,
              child: userEntity.avatarUrl == null ?  Image.asset('assets/images/user.png') :
              Image.network(userEntity.avatarUrl!,)
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                  userEntity.userName,
                  style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
            ),
          ),
          FollowButton(userEntity: userEntity,type: type,),
        ],
      ),
  );
  }

}