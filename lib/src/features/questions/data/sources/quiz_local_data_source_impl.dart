import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/local_models/category_local.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/local_models/result_local.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/local_models/user_info_local.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source.dart';

class QuizLocalDataSourceImpl implements QuizLocalDataSource{
 late Future<Isar> db;
 QuizLocalDataSourceImpl() {
  db=_openDb();
 }

 Future<Isar> _openDb() async{
 final dir= await getApplicationDocumentsDirectory();
 if(Isar.instanceNames.isEmpty){
  return await Isar.open(
      [UserInfoLocalSchema,CategoryLocalSchema,ResultLocalSchema],
      directory: dir.path,
  );
 }
 return Future.value(Isar.getInstance());
 }

 // save user name
 @override
  Future<void>  saveUserName(String name) async{
   try{
     final isar= await db;
     final userName=UserInfoLocal(userName: name);
     await isar.writeTxn(() async {
       isar.userInfoLocals.put(userName);
     });
   } catch (err) {
     return Future.error(Exception(err));
   }
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
 Future<List<CategoryLocal>>  getCategory() async{
   try{
     final isar = await db;
     final dataCategories = await isar.categoryLocals.where().findAll();
     return dataCategories;
   } catch (err) {
     return Future.error(Exception(err));
   }
 }
  // get info user
  @override
  Future<String>  getInfoUser() async{
   try{
      final isar = await db;
      final  nameInfo= await isar.userInfoLocals.where().findFirst();
        return nameInfo?.userName ?? '';
   } catch (err) {
     return Future.error(Exception(err));
   }
  }
  // delete info user
  @override
  Future<void> deleteInfoUser() async{
    try{
      final isar = await db;
      await isar.writeTxn(() async {
        isar.userInfoLocals.clear();
      });
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