import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/user_firestore_model.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/user_info_local.dart';

class UserEntity {
  final String uid;
  final String userName;
  final double coin;
  final String? avatarUrl;

  UserEntity({
    required this.uid,
    required this.userName,
    required this.coin,
    this.avatarUrl,
  });

  factory UserEntity.fromLocal(UserInfoLocal userLocal) {
    return UserEntity(
      uid: userLocal.uid,
      userName: userLocal.userName,
      coin: userLocal.coin,
      avatarUrl: userLocal.avatarUrl,
    );
  }

  factory UserEntity.fromFirestore(UserFirestoreModel userFromFirestore) {
    return UserEntity(
      uid: userFromFirestore.uid,
      userName: userFromFirestore.name,
      coin: userFromFirestore.coin,
      avatarUrl: userFromFirestore.avatarUrl,
    );
  }
}
