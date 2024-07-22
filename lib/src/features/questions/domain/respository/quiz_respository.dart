import 'package:trivia_app_with_flutter/src/features/questions/data/respository/quiz_respositoryimpl.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source_impl.dart';

import '../entity/category_entity.dart';
import '../entity/question_entity.dart';

abstract class QuizRespository{
  Future<void> saveUserName(String name);
  Future<List<QuestionEntity>> fetchQuestions(int amount,int idCategory, String? difficulty,String? type);
  Future<List<CategoryEntity>> fetchCategories();
  Future<String> getInfoUser();
  Future<void> deleteInfo();
   factory QuizRespository.create() {
     return QuizRespositoryImpl();
   }
}