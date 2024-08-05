import 'package:trivia_app_with_flutter/src/features/user/data/sources/user_local_data_source_impl.dart';
import '../model/coin_history_local.dart';
import '../model/user_info_local.dart';


abstract class  UserLocalDataSource{

  Future<void>  saveUserName(String name);

  Future<void> changeUserName(String name);

  Stream<List<UserInfoLocal>> getInfoUser();

  Future<UserInfoLocal> getUser();

  Future<void> deleteInfoUser();

  Future<void> addCoin(double coin);

  Future<void> subtractionCoin(double coin);

  Stream<List<CoinHistoryLocal>> watchCoinHistoryInThirtyDays(int pageIndex);

  Future<List<CoinHistoryLocal>> getCoinHistories(int pageIndex);

  Future<void> deleteCoinHistory(int id);

  factory UserLocalDataSource.create() {
    return UserLocalDataSourceImpl();
  }
}