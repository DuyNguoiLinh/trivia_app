import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';

import '../controller/follower_controller.dart';

class MessageButton extends ConsumerWidget {
  const MessageButton({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowing = ref.watch(followerProvider(userEntity.uid));
    final following = ref.watch(stateFollowerProvider(userEntity.uid));
    final isFollowing = asyncFollowing.isLoading;
    // if (following != null) {
    if (!isFollowing) {
      return Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 15),
            width: following ? 170 : 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'Message',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7), fontSize: 18),
              ),
            ),
          ),
          if(following)
            Container(
              width: 50,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(stateFollowerProvider(userEntity.uid).notifier)
                        .state = false;
                    ref
                        .read(followerProvider(userEntity.uid).notifier)
                        .toggleFollow(userEntity.uid);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white60,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Image.asset('assets/images/cancel.png')),
            )
        ],
      );
      // } else {
      //   return const Center(child: CircularProgressIndicator(),);
      // }
    } else {
      return const Center(child: CircularProgressIndicator(),);
    }
  }

}
