
import '../../data/repository/user_repository_impl.dart';
import '../entity/user_entity.dart';

abstract class UserRepository{

  Future<void> saveUserName(String name);
  Future<UserEntity> getInfoUser();
  Future<void> deleteInfo();
  Future<void> updateCoin(double coin);

  factory UserRepository.create() {
    return UserRepositoryImpl();
  }
}