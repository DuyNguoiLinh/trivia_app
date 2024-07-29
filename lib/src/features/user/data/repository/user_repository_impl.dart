import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/question_local.dart';
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
  @override
  Future<void> changeUserName(String name) async{
    await localDataSource.changeUserName(name);
  }

  // update coin
  @override
  Stream<UserEntity> getInfoUser() {
    return localDataSource.getInfoUser().map((userLocal) {
      return userLocal
          .map((user) => UserEntity.fromLocal(user))
          .toList()
          .first;
    });
  }


  // get info user in local
  @override
  Future<UserEntity> initInfoUser() async {
    try {
      final userNameLocal = await localDataSource.initInfoUser();
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
  Future<void> updateCoin(double coin) async {
    try {
      await localDataSource.updateCoin(coin);
    } catch (err) {
      return Future.error(err);
    }
  }

  //   save question into Local
  @override
  Future<void> saveOrNotQuestion(QuestionEntity questionEntity) async {
    final questionLocal = QuestionLocal(
        idQuestion: questionEntity.id,
        question: questionEntity.question,
        correctAnswer: questionEntity.correctAnswer,
        incorrectAnswers: questionEntity.incorrectAnswers);
     await localDataSource.saveOrNotQuestion(questionLocal);
  }


}

