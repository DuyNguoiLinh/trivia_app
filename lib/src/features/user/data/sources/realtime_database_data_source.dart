import 'package:trivia_app_with_flutter/src/features/user/data/sources/realtime_database_data_source_impl.dart';

import '../model/firebase_model/user_realtime_database_model.dart';

abstract class RealtimeDatabaseDataSource {

  Future<void>  addUser(UserRealtimeDatabaseModel user);

  Future<void> addCoin(String uid , double coin);

  Future<void> subtractCoin(String uid , double coin);

  Future<void> sendCoin(String senderUid, String receiverUid, double amountCoin);

  Stream<double> listenToCoinChanges(String uid);

  Future<void> deleteUser(String uid);

  factory RealtimeDatabaseDataSource.create() {
    return RealtimeDatabaseDataSourceImpl();
  }
}