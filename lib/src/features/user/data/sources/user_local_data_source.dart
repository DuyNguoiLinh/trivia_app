import 'package:trivia_app_with_flutter/src/features/user/data/sources/user_local_data_source_impl.dart';
import '../model/coin_history_local.dart';
import '../model/user_info_local.dart';


abstract class  UserLocalDataSource{

  Future<void>  saveUserName(String name,double coin, String uid);

  Future<void> changeUserName(String uid,String name);

  Stream<List<UserInfoLocal>> getInfoUser(String uid);

  Future<UserInfoLocal?> getUser(String uid);

  Future<void> deleteInfoUser();

  Future<void> addCoin(double coin,String uid,CoinHistoryLocal coinHistoryLocal);

  Future<void> subtractionCoin(double coin,String uid,CoinHistoryLocal coinHistoryLocal);

  Stream<List<CoinHistoryLocal>> watchCoinHistoryInThirtyDays(int pageIndex);

  Future<List<CoinHistoryLocal>> getCoinHistories(int pageIndex,int pageSize,String uid);

  Future<void> saveCoinHistories(List<CoinHistoryLocal> listCoinHistory,String uid);

  Future<void> deleteCoinHistory(String idTransaction);

  Future<void> deleteLocalData(String uid);

  factory UserLocalDataSource.create() {
    return UserLocalDataSourceImpl();
  }
}