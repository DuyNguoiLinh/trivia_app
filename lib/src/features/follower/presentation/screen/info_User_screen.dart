import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/widget/follow_button.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/widget/message_button.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/widget/text_follow_button.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/global_variables.dart';

import 'list_follower_screen.dart';

class InfoUserScreen extends ConsumerWidget {
  const InfoUserScreen({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

      return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.black54),
              width: double.infinity,
              height: 200,
              child: userEntity.avatarUrl == null
                  ? Image.asset('assets/images/user.png')
                  : Image.network(userEntity.avatarUrl!),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userEntity.userName,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.wallet, size: 24.0),
                        Expanded(
                          child: Text(
                            userEntity.uid,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: userEntity.uid));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Address copied to clipboard')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Joined  December 2022',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                   TextFollowButton(userEntity: userEntity),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        FollowButton(userEntity: userEntity,type: 'info',),
                        MessageButton(userEntity: userEntity),
                      const Icon(
                        Icons.file_download_outlined,
                        size: 35,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Data Statistical',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
