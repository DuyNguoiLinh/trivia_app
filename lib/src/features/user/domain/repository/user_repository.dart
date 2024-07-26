
import '../../data/repository/user_repository_impl.dart';
import '../entity/user_entity.dart';

abstract class UserRepository{
  Stream<UserEntity> getInfoUser();
  Future<void> saveUserName(String name);
  Future<UserEntity> initInfoUser();
  Future<void> deleteInfo();
  Future<void> updateCoin(double coin);

  factory UserRepository.create() {
    return UserRepositoryImpl();
  }
}