import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';

class AsyncUserNotifier extends AutoDisposeAsyncNotifier<UserEntity> {

  final userRepository = UserRepository.create();
  StreamSubscription<UserEntity>? _subscription;

  @override
  FutureOr<UserEntity> build() async{

    final userInfo =await userRepository.initInfoUser();

    // _subscription?.cancel();
    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = userRepository.getInfoUser().listen(
            (user) {
          state=const AsyncLoading();
          print(user.coin);
          state = AsyncValue.data(user);
        }, onError: (err,stackTr){
          state= AsyncValue.error(err,stackTr);
    }
    );

    return userInfo;
  }


  Future<void> saveUseName(String name) async {
    await userRepository.saveUserName(name);
  }


}
final userProvider = AsyncNotifierProvider.autoDispose<AsyncUserNotifier,UserEntity>(() => AsyncUserNotifier());
