import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/app_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/router_controller.dart';
import '../../domain/repository/user_repository.dart';
import '../../global_variables.dart';

class AsyncUserNotifier extends AsyncNotifier<UserEntity> {

  final userRepository = UserRepository.create();
  StreamSubscription<UserEntity>? _subscription;
  String _uid= '';
  @override
  FutureOr<UserEntity> build() async{

    final authState = ref.watch(authStateProvider);
     _uid = authState.asData?.value?.uid ?? '';
    // _uid=await ref.watch(appProvider.future);


    final userInfo =userRepository.getUser(_uid);

    // _subscription?.cancel();
    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = userRepository.getInfoUser(_uid).listen(
            (user) {
              coin = user.coin ;
          state = AsyncValue.data(user);
        }, onError: (err,stackTr){
          state= AsyncValue.error(err,stackTr);
    }
    );

    return userInfo;
  }

  //  init user name
  Future<void> saveUseName(String name,double coin ,String uid) async {
    await userRepository.saveUserName(name,coin , uid);
  }

  //   change user name
  Future<void> changeUserName(String name) async{
    await userRepository.changeUserName(_uid ,name);
  }

}
final userProvider = AsyncNotifierProvider<AsyncUserNotifier,UserEntity>(() => AsyncUserNotifier());
