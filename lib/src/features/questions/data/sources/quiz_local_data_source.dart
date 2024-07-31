import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source_impl.dart';
import '../models/local/category_local.dart';
import '../models/local/question_local.dart';
import '../models/local/result_local.dart';

abstract class  QuizLocalDataSource{

  Future<void>  saveCategory(List<CategoryLocal> listCategoryLocal);
  Future<List<CategoryLocal>>  getCategories();
  Future<void>  saveResultQuiz(ResultLocal resultLocal);
  Future<void> toggleSaveQuestion(QuestionLocal questionLocal);
  Future<List<CategoryLocal>> getCategoryHasQuestion();

  factory QuizLocalDataSource.create() {
     return QuizLocalDataSourceImpl();
   }
}