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
  Future<void> saveUserInfo(String name, double coin, String uid,String? avatarUrl) async {
    try {
      final isar = await db;
      final user = await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();

      if (user == null) {
        final infoUser = UserInfoLocal(userName: name, coin: coin, uid: uid,avatarUrl: avatarUrl);
        await isar.writeTxn(() async {
          await isar.userInfoLocals.put(infoUser);
        });

      } else {
        user.coin =coin;
        user.userName=name;
        user.avatarUrl=avatarUrl;

        await isar.writeTxn(() async {
          await isar.userInfoLocals.put(user);
        });

      }
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // change user name
  @override
  Future<void> changeUserName(String uid, String name) async {
    try {
      final isar = await db;
      final infoUser =
          await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
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
  @override
  Future<void> changeAvatar(String uid, String avatarUrl) async {
    try {
      final isar = await db;
      final infoUser =
      await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
      if (infoUser != null) {
        infoUser.avatarUrl = avatarUrl;
        await isar.writeTxn(() async {
          isar.userInfoLocals.put(infoUser);
        });
      }
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // updated Coin
  @override
  Future<void> updatedCoin(String uid, double newAmountCoin) async {
    try {
      final isar = await db;
      final infoUser =
          await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
      if (infoUser != null) {
        infoUser.coin += newAmountCoin;
        await isar.writeTxn(() async {
          isar.userInfoLocals.put(infoUser);
        });
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  // get info
  @override
  Future<UserInfoLocal?> getUser(String uid) async {
    try {
      final isar = await db;
      final userLocal =
          await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
      return userLocal;
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // update info user
  @override
  Stream<List<UserInfoLocal>> getInfoUser(String uid) async* {
    final isar = await db;
    Query<UserInfoLocal> userLocal =
        isar.userInfoLocals.filter().uidEqualTo(uid).build();
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
  Future<void> addCoin(
      double coin, String uid, CoinHistoryLocal coinHistoryLocal) async {
    try {
      final isar = await db;
      final userInfo =
          await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
      if (userInfo == null) {
        return;
      }

      userInfo.coin += coin;
      userInfo.coinHistories.add(coinHistoryLocal);

      await isar.writeTxn(() async {
        await isar.coinHistoryLocals.put(coinHistoryLocal);

        await isar.userInfoLocals.put(userInfo);

        await userInfo.coinHistories.save();
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // subtraction coin
  @override
  Future<void> subtractCoin(
      double coin, String uid, CoinHistoryLocal coinHistoryLocal) async {
    try {
      final isar = await db;
      final userInfo =
          await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();

      if (userInfo != null) {
        userInfo.coin -= coin;
        userInfo.coinHistories.add(coinHistoryLocal);

        await isar.writeTxn(() async {
          await isar.coinHistoryLocals.put(coinHistoryLocal);

          isar.userInfoLocals.put(userInfo);

          await userInfo.coinHistories.save();
        });
      }
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
       String uid) async* {

    final isar = await db;
    final thirtyAgo = DateTime.now().subtract(const Duration(days: 30));

    final userInfo =
    await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();

   if(userInfo != null) {

     Query<CoinHistoryLocal> histories =  userInfo.coinHistories
         .filter()
         .timestampGreaterThan(thirtyAgo)
         .sortByTimestampDesc()
         .build();
     await for (final list in histories.watch(fireImmediately: true)) {
       if (list.isNotEmpty) {

         final List<CoinHistoryLocal> newList= [list.first];
         yield newList;

       } else {
         yield [];
       }
     }
   } else {
     yield List<CoinHistoryLocal>.empty();
   }

  }

  // get coinHistories by pageIndex
  @override
  Future<List<CoinHistoryLocal>> getCoinHistories(
      int pageIndex, int pageSize, String uid) async {
    try {

      final isar = await db;
      final offset = pageIndex * pageSize;
      final thirtyAgo = DateTime.now().subtract(const Duration(days: 30));

      final userInfo =
          await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();

      if (userInfo != null) {
        final pageHistories = await userInfo.coinHistories
            .filter()
            .sortByTimestampDesc()
            .offset(offset)
            .limit(pageSize)
            .findAll();
        return pageHistories;
      } else {
        return [];
      }
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // save coin History
  @override
  Future<void> saveCoinHistories(
      List<CoinHistoryLocal> listCoinHistory, String uid) async {
    try {
      final isar = await db;

      final coinHistories = await isar.coinHistoryLocals.where().isEmpty();
      final userInfo =
          await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
      if (userInfo == null) {
        return;
      }

      if (coinHistories) {

        userInfo.coinHistories.addAll(listCoinHistory);
        await isar.writeTxn(() async {
          await isar.coinHistoryLocals.putAll(listCoinHistory);
          await userInfo.coinHistories.save();
        });

      } else {
        final currentListCoinHistory =
            await isar.coinHistoryLocals.where().findAll();

        final newCoinHistories = listCoinHistory
            .where((e) => !currentListCoinHistory
                .any((i) => i.idTransaction == e.idTransaction))
            .toList();

        userInfo.coinHistories.addAll(newCoinHistories);

        await isar.writeTxn(() async {
          await isar.coinHistoryLocals.putAll(newCoinHistories);
          await userInfo.coinHistories.save();
        });
      }
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  //  Delete coin history by id
  @override
  Future<void> deleteCoinHistory(String idTransaction) async {
    try {
      final isar = await db;

      await isar.writeTxn(() async {
        isar.coinHistoryLocals
            .filter()
            .idTransactionEqualTo(idTransaction)
            .deleteAll();
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  @override
  Future<void> deleteLocalData(String uid) async {
    try {
      final isar = await db;

      await isar.writeTxn(() async {
        await isar.clear();
      });

    } catch (err) {
      return Future.error(Exception(err));
    }
  }
}
