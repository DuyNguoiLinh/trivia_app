import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_remote_data_source_impl.dart';

import '../models/question_model.dart';

abstract class QuizRemoteDataSource{
  Future<List<QuestionModel>> getQuestions(int amount, int idCategory, String? difficulty);
 factory QuizRemoteDataSource.create() {
   return QuizRemoteDataSourceImpl();
 }
}