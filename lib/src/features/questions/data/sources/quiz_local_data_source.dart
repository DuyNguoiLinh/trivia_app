import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source_impl.dart';

import '../models/local_models/category_local.dart';
import '../models/local_models/result_local.dart';

abstract class  QuizLocalDataSource{
  Future<void>  saveUserName(String name);
  Future<void>  saveCategory(List<CategoryLocal> listCategoryLocal);
  Future<List<CategoryLocal>>  getCategory();
  Future<String>  getInfoUser();
  Future<void> deleteInfoUser();
  Future<void>  saveResultQuiz(ResultLocal resultLocal);
   factory QuizLocalDataSource.create() {
     return QuizLocalDataSourceImpl();
   }
}