import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/coin_history_local.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/user_local_data_source.dart';
import '../../../questions/data/models/local/category_local.dart';
import '../../../questions/data/models/local/result_local.dart';
import '../model/user_info_local.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  late Future<Isar> db;

  UserLocalDataSourceImpl() {
    db = _openDb();
  }

  // openDb
  Future<Isar> _openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          UserInfoLocalSchema,
          CategoryLocalSchema,
          ResultLocalSchema,
          CoinHistoryLocalSchema
        ],
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  // save user name
  @override
  Future<void> saveUserName(String name) async {
    try {
      final isar = await db;
      final userName = UserInfoLocal(userName: name);
      await isar.writeTxn(() async {
        isar.userInfoLocals.put(userName);
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // get info
  @override
  Future<UserInfoLocal> initInfoUser() async {
    try {
      final isar = await db;
      final userLocal = await isar.userInfoLocals.where().findAll();
      return userLocal.first;
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // update info user
  @override
  Stream<List<UserInfoLocal>> getInfoUser() async* {
      final isar = await db;
      Query<UserInfoLocal>  userLocal =  isar.userInfoLocals.where().build();
      yield* userLocal.watch(fireImmediately: true);
  }

  // delete info user
  @override
  Future<void> deleteInfoUser() async {
    try {
      final isar = await db;
      await isar.writeTxn(() async {
        isar.userInfoLocals.clear();
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }


//   update coin
  @override
  Future<void> updateCoin(double coin) async {
    try {
      final isar = await db;
      await isar.writeTxn(() async {
        final userInfo = await isar.userInfoLocals.where().findFirst();
        if (userInfo != null) {
          final historyCoin = CoinHistoryLocal(
              oldAmount: userInfo.coin, amountEarnCoin: coin, timestamp: DateTime.now());
          userInfo.coin += coin;
          isar.coinHistoryLocals.put(historyCoin);
          isar.userInfoLocals.put(userInfo);
        }
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

}