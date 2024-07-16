import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_remote_data_source_impl.dart';

import '../models/categories_response.dart';
import '../models/category_response.dart';
import '../models/question_model.dart';

abstract class QuizRemoteDataSource{
  Future<List<QuestionModel>> getQuestions(int amount,int idCategory, String? difficulty ,String? type);
  Future<List<CategoryResponse>> getCategories();
  factory QuizRemoteDataSource.create() {
   return QuizRemoteDataSourceImpl();
 }
}