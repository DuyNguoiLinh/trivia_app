import 'package:trivia_app_with_flutter/src/features/user/data/model/user_info_local.dart';

class UserEntity {
  final String userName;
  final double coin;

  UserEntity({required this.userName, required this.coin});

  factory UserEntity.fromLocal(UserInfoLocal userLocal) {
    return UserEntity(userName: userLocal.userName, coin: userLocal.coin);
  }
}
