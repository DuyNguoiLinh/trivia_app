import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source_impl.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/user_local_data_source_impl.dart';

import '../../../questions/data/models/local/question_local.dart';
import '../model/user_info_local.dart';


abstract class  UserLocalDataSource{

  Future<void>  saveUserName(String name);
  Future<void> changeUserName(String name);
  Stream<List<UserInfoLocal>> getInfoUser();
  Future<UserInfoLocal> getUser();
  Future<void> deleteInfoUser();
  Future<void> addCoin(double coin);
  Future<void> subtractionCoin(double coin);

  factory UserLocalDataSource.create() {
    return UserLocalDataSourceImpl();
  }
}