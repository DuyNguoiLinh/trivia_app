import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';

class AsyncUserNotifier extends AutoDisposeAsyncNotifier<UserEntity> {
  final userRepository = UserRepository.create();

  @override
  FutureOr<UserEntity> build() async{
    final userNameInfo =await userRepository.getInfoUser();
    return userNameInfo;
  }

  Future<void> saveUseName(String name) async {
    await userRepository.saveUserName(name);
  }


}
final userProvider = AsyncNotifierProvider.autoDispose<AsyncUserNotifier,UserEntity>(() => AsyncUserNotifier());
