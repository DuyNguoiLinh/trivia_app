import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';

class AsyncUserNotifier extends AutoDisposeAsyncNotifier<UserEntity> {

  final userRepository = UserRepository.create();
  StreamSubscription<UserEntity>? _subscription;

  @override
  FutureOr<UserEntity> build() async{

    final userInfo =userRepository.getUser();

    // _subscription?.cancel();
    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = userRepository.getInfoUser().listen(
            (user) {
          print(user.coin);
          state = AsyncValue.data(user);
        }, onError: (err,stackTr){
          state= AsyncValue.error(err,stackTr);
    }
    );

    return userInfo;
  }

  //  init user name
  Future<void> saveUseName(String name) async {
    userRepository.saveUserName(name);
  }
  //   change user name
  Future<void> changeUserName(String name) async{
    userRepository.changeUserName(name);
  }

}
final userProvider = AsyncNotifierProvider.autoDispose<AsyncUserNotifier,UserEntity>(() => AsyncUserNotifier());
