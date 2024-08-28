import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ntp/ntp.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/router_controller.dart';
import '../../data/model/firebase_model/coin_realtime_database_model.dart';
import '../../data/sources/realtime_database_data_source_impl.dart';
import '../../domain/repository/user_repository.dart';
import '../../global_variables.dart';

class AsyncUserNotifier extends AsyncNotifier<UserEntity?> {

  final _userRepository = UserRepository.create();

  final ImagePicker _picker = ImagePicker();

  StreamSubscription<UserEntity>? _subscription;
  StreamSubscription<CoinRealtimeDatabaseModel?>? _coinSubscription;
  String _uid= '';
  final time = DateTime.now().toUtc().millisecondsSinceEpoch;
  @override
  FutureOr<UserEntity?> build() async{

    final authState = ref.watch(authStateProvider);
     _uid = authState.asData?.value?.uid ?? '';
    // global
    uidGlobal=_uid;

    final userInfo =await _userRepository.getUser(_uid);

    // _subscription?.cancel();
    ref.onDispose(() {
      _subscription?.cancel();
      _coinSubscription?.cancel();
    },);

    final ntpTime = await NTP.now();
    final now = ntpTime.millisecondsSinceEpoch;

    _coinSubscription = _userRepository.listenToCoinChanges(uidGlobal,now).listen((
        newValue) async {
      if (newValue != null) {
          await _userRepository.updatedCoin(uidGlobal, newValue.coin);
      }
    }
    );

    _subscription = _userRepository.watchInfoUser(_uid).listen(
            (user) {
              coinGlobal = user.coin ;
          state = AsyncValue.data(user);
        }, onError: (err,stackTr){
          state= AsyncValue.error(err,stackTr);
    }
    );

    return null;
  }

  //  init user name
  Future<void> saveUseName(String name,double coin ,String uid, String avatarUrl) async {
    await _userRepository.saveUserInfo(name,coin , uid, null );


  }

  // changed avatar
  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        await _userRepository.uploadAvatar(pickedFile, uidGlobal);

        ref.invalidateSelf();
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  //   change user name
  Future<void> changeUserName(String name) async{
    await _userRepository.changeUserName(_uid ,name);


  }

}
final userProvider = AsyncNotifierProvider<AsyncUserNotifier,UserEntity?>(() => AsyncUserNotifier());
