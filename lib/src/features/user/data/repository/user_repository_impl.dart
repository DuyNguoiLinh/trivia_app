
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';

import '../../domain/repository/user_repository.dart';
import '../sources/user_local_data_source.dart';

class UserRepositoryImpl implements UserRepository {

  final localDataSource = UserLocalDataSource.create();

  // save user name
  @override
  Future<void> saveUserName(String name) async {
    await localDataSource.saveUserName(name);
  }

  // get info user in local
  @override
  Future<UserEntity> getInfoUser() async {
    try {
      final userNameLocal = await localDataSource.getInfoUser();
      final userNameInfo = UserEntity.fromLocal(userNameLocal);
      return userNameInfo;
    } catch (err) {
      return Future.error(err);
    }
  }

  //  delete info user in local
  @override
  Future<void> deleteInfo() async {
    try {
      await localDataSource.deleteInfoUser();
    } catch (err) {
      return Future.error(err);
    }
  }

  //   update coin
  @override
  Future<void> updateCoin(double coin) async{
    try {
      await localDataSource.updateCoin(coin);
    } catch (err) {
      return Future.error(err);
    }
  }

}

