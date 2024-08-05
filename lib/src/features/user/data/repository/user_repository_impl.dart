import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
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

  // change user name
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
  Future<UserEntity> getUser() async {

    try {
      final userLocal = await localDataSource.getUser();
      final userInfo = UserEntity.fromLocal(userLocal);
      return userInfo;
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

  //   addition  coin
  @override
  Future<void> additionCoin(double coin) async {
    try {
      await localDataSource.addCoin(coin);
    } catch (err) {
      return Future.error(err);
    }
  }

  // subtraction coin
  @override
  Future<void> subtractionCoin(double coin) async {
    try {
      await localDataSource.subtractionCoin(coin);
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Stream<List<CoinHistoryEntity>>  watchCoinHistoryLocal(int pageIndex)  {

    return localDataSource.watchCoinHistoryInThirtyDays(pageIndex).map((listCoinHistory) {

      return listCoinHistory.map((e) => CoinHistoryEntity.fromLocal(e)).toList();

    });
 }

  @override
  Future<List<CoinHistoryEntity>> getCoinHistories(int pageIndex) async{
    try {

      final coinHistoriesLocal = await localDataSource.getCoinHistories(pageIndex);
      final coinHistories = coinHistoriesLocal.map((e) => CoinHistoryEntity.fromLocal(e)).toList();
      return coinHistories;

    } catch (err) {
      return Future.error(err);
    }
  }
  // delete CoinHistory
  @override
  Future<void> deleteCoinHistory(int id) async{
    try {
       await localDataSource.deleteCoinHistory(id);
    } catch (err) {
      return Future.error(err);
    }
  }


}

