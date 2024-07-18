import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source_impl.dart';

abstract class  QuizLocalDataSource{
  Future<void>  saveUserName(String name);
  Future<String>  getInfoUser();
  Future<void> deleteInfoUser();
   factory QuizLocalDataSource.create() {
     return QuizLocalDataSourceImpl();
   }
}