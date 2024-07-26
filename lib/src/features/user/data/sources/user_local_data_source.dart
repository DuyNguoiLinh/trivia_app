import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source_impl.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/user_local_data_source_impl.dart';

import '../model/user_info_local.dart';


abstract class  UserLocalDataSource{

  Future<void>  saveUserName(String name);
  Future<UserInfoLocal> getInfoUser();
  Future<void> deleteInfoUser();
  Future<void> updateCoin(double coin);

  factory UserLocalDataSource.create() {
    return UserLocalDataSourceImpl();
  }
}