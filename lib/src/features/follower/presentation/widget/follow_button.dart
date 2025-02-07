import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/global_variables.dart';
import '../controller/follower_controller.dart';

class FollowButton extends ConsumerWidget {
  FollowButton({super.key, required this.userEntity, required this.type});

  final UserEntity userEntity;
  final String type;

  bool isClicked = false;
  late Timer _timer;

  _startTimer() {
    _timer = Timer(const Duration(milliseconds: 1000), () => isClicked = false);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncFollowing = ref.watch(followerProvider(userEntity.uid));
    final following = ref.watch(stateFollowerProvider(userEntity.uid));
   final isFollowing =asyncFollowing.isLoading;

    // if (following != null) {
      if (following == true && userEntity.uid != uidGlobal && type == 'info') {
        return const SizedBox();
      } else {
        if (!isFollowing) {
          return Container(
            // margin: const EdgeInsets.only(right: 5),
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                if (isClicked == false) {
                  _startTimer();
                  isClicked = true;
                  ref
                      .read(stateFollowerProvider(userEntity.uid).notifier)
                      .state = !following;
                  ref
                      .read(followerProvider(userEntity.uid).notifier)
                      .toggleFollow(userEntity.uid);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                following ? Colors.grey.withOpacity(0.1) : Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                following
                    ? type == 'follower'
                    ? "Friend"
                    : 'Following'
                    : 'Follow',
                style: TextStyle(
                    color: following ? Colors.black : Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else {
          return const Center(
                  child: CircularProgressIndicator() );
    }
    // } else {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
  }
}
}
