import 'package:trivia_app_with_flutter/src/features/user/data/sources/realtime_database_data_source_impl.dart';

import '../model/firebase_model/coin_realtime_database_model.dart';


abstract class RealtimeDatabaseDataSource {

  // Future<void> addCoin(String uid , double coin);

  // Future<void> changeName(String uid, String newUserName);

  // Future<void> subtractCoin(String uid , double coin);

  Future<void> sendCoinRealtime(String uid, CoinRealtimeDatabaseModel newCoin);

  Stream<CoinRealtimeDatabaseModel?> listenToCoinChanges(String uid, int now);

  // Future<void> deleteUser(String uid);

  factory RealtimeDatabaseDataSource.create() {
    return RealtimeDatabaseDataSourceImpl();
  }
}