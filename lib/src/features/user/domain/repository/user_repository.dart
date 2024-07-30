
import '../../../questions/domain/entity/question_entity.dart';
import '../../data/repository/user_repository_impl.dart';
import '../entity/user_entity.dart';

abstract class UserRepository{

  Stream<UserEntity> getInfoUser();
  Future<void> saveUserName(String name);
  Future<void> changeUserName(String name);
  Future<UserEntity> getUser();
  Future<void> deleteInfo();
  Future<void> additionCoin(double coin);
  Future<void> subtractionCoin(double coin);

  factory UserRepository.create() {
    return UserRepositoryImpl();
  }
}