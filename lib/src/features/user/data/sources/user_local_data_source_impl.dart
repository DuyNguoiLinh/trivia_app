import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/coin_history_local.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/local/question_local.dart';
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
          CoinHistoryLocalSchema,
          QuestionLocalSchema
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
      final infoUser = UserInfoLocal(userName: name);
      await isar.writeTxn(() async {
        isar.userInfoLocals.put(infoUser);
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // change user name
  @override
  Future<void> changeUserName(String name) async {
    try {
      final isar = await db;
      final infoUser = await isar.userInfoLocals.where().findFirst();
      if (infoUser != null) {
        infoUser.userName = name;
        await isar.writeTxn(() async {
          isar.userInfoLocals.put(infoUser);
        });
      }
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // get info
  @override
  Future<UserInfoLocal> getUser() async {
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
    Query<UserInfoLocal> userLocal = isar.userInfoLocals.where().build();
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

//   addition coin
  @override
  Future<void> addCoin(double coin) async {
    try {
      final isar = await db;
      final userInfo = await isar.userInfoLocals.where().findFirst();
      if (userInfo == null) {
        return;
      }

      final historyCoin = CoinHistoryLocal(
          oldAmount: userInfo.coin,
          amountEarnCoin: coin,
          timestamp: DateTime.now(),
          type: 'earn');

      userInfo.coin += coin;
      userInfo.coinHistories.add(historyCoin);

      await isar.writeTxn(() async {
        await isar.userInfoLocals.put(userInfo);

        await isar.coinHistoryLocals.put(historyCoin);

        await userInfo.coinHistories.save();
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // subtraction coin
  @override
  Future<void> subtractionCoin(double coin) async {
    try {
      final isar = await db;
      final userInfo = await isar.userInfoLocals.where().findFirst();

      if (userInfo == null) {
        return;
      }

      final historyCoin = CoinHistoryLocal(
          oldAmount: userInfo.coin,
          amountEarnCoin: coin,
          timestamp: DateTime.now(),
          type: 'fee');

      userInfo.coin -= coin;
      userInfo.coinHistories.add(historyCoin);

      await isar.writeTxn(() async {
        await isar.userInfoLocals.put(userInfo);

        await isar.coinHistoryLocals.put(historyCoin);

        await userInfo.coinHistories.save();
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

//    delete historyCoin record less than 30 day
  Future<void> _deleteOldHistoryCoin() async {
    final isar = await db;
    final thirtyAgo = DateTime.now().subtract(const Duration(days: 30));

    await isar.writeTxn(() async {
      final oldRecord = await isar.coinHistoryLocals
          .filter()
          .timestampLessThan(thirtyAgo)
          .findAll();

      for (final record in oldRecord) {
        await isar.coinHistoryLocals.delete(record.id);
      }
    });
  }

  //  watch CoinHisToryLocal in thirty days
  @override
  Stream<List<CoinHistoryLocal>> watchCoinHistoryInThirtyDays(
      int pageIndex) async* {
    final isar = await db;
    final thirtyAgo = DateTime.now().subtract(const Duration(days: 30));
    final int offset = pageIndex * 5;

    Query<CoinHistoryLocal> histories = isar.coinHistoryLocals
        .filter()
        .timestampGreaterThan(thirtyAgo)
        .sortByTimestampDesc()
        .build();

    yield* histories.watch(fireImmediately: true).map((listHistory) {
      return listHistory.skip(offset).take(5).toList();
    });
  }

  // get coinHistories by pageIndex
  @override
  Future<List<CoinHistoryLocal>> getCoinHistories(int pageIndex) async {
    try {
      final isar = await db;

      final thirtyAgo = DateTime.now().subtract(const Duration(days: 30));

      final int offset = pageIndex * 5;

      final listHistory = await isar.coinHistoryLocals
          .filter()
          .timestampGreaterThan(thirtyAgo)
          .sortByTimestampDesc()
          .findAll();

      final pageHistories = listHistory.skip(offset).take(5).toList();

      return pageHistories;
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  //  Delete coin history by id
  @override
  Future<void> deleteCoinHistory(int id) async {
    try {
      final isar = await db;

      await isar.writeTxn(() async {
        isar.coinHistoryLocals.delete(id);
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }
}
