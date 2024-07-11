import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/info_local.dart';
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
      [UserNameLocalSchema],
      directory: dir.path,
  );
 }
 return Future.value(Isar.getInstance());
 }
 @override
  Future<void>  saveUserName(String name) async{
   try{
     final isar= await db;
     final userName=InfoLocal(userName: name);
     await isar.writeTxn(() async {
       isar.userNameLocals.put(userName);
     });
   } catch (err) {
     return Future.error(Exception(err));
   }

 }
}