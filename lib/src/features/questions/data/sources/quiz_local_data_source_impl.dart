import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/coin_history_local.dart';
import '../models/local/category_local.dart';
import '../models/local/result_local.dart';
import '../../../user/data/model/user_info_local.dart';

class QuizLocalDataSourceImpl implements QuizLocalDataSource{
 late Future<Isar> db;
 QuizLocalDataSourceImpl() {
  db=_openDb();
 }

 Future<Isar> _openDb() async{
 final dir= await getApplicationDocumentsDirectory();
 if(Isar.instanceNames.isEmpty){
  return await Isar.open(
      [UserInfoLocalSchema,CategoryLocalSchema,ResultLocalSchema,CoinHistoryLocalSchema],
      directory: dir.path,
  );
 }
 return Future.value(Isar.getInstance());
 }

 // save category
 @override
  Future<void>  saveCategory(List<CategoryLocal> listCategoryLocal) async{
   try{
       final isar = await db;
        await isar.writeTxn(() async => isar.categoryLocals.putAll(listCategoryLocal));
   } catch (err) {
     return Future.error(Exception(err));
   }
 }

 // get category
 @override
 Future<List<CategoryLocal>>  getCategories() async{
   try{
     final isar = await db;
     final dataCategories = await isar.categoryLocals.where().findAll();
     return dataCategories;
   } catch (err) {
     return Future.error(Exception(err));
   }
 }

//   save result quiz
  @override
  Future<void>  saveResultQuiz(ResultLocal resultLocal) async{
    try{
      final isar= await db;
      await isar.writeTxn(() async {
        isar.resultLocals.put(resultLocal);
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

}