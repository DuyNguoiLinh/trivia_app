import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/respository/quiz_respository.dart';

class QuizRespositoryimpl implements QuizRespository{
    final localDataSource=QuizLocalDataSource.create();

    @override
  Future<void> saveUserName(String name) async{
      await localDataSource.saveUserName(name);
    }
  @override
  Future<String> getInfoUser() async{
      try{
        final userNameInfo = await localDataSource.getInfoUser();
        return userNameInfo;
      }catch (err) {
        return Future.error(err);
      }
  }
  Future<void> deleteInfo() async{
    try{
     await localDataSource.deleteInfoUser();
    }catch (err) {
      return Future.error(err);
    }
  }
}