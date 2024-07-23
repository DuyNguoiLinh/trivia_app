
import '../../data/repository/quiz_respositoryimpl.dart';
import '../entity/category_entity.dart';
import '../entity/question_entity.dart';
import '../entity/result_entity.dart';

abstract class QuizRepository{

  Future<void> saveUserName(String name);
  Future<List<QuestionEntity>> fetchQuestions(int amount,int idCategory, String? difficulty,String? type);
  Future<List<CategoryEntity>> fetchCategories();
  Future<String> getInfoUser();
  Future<void> deleteInfo();
  Future<void> saveResultQuiz(ResultEntity resultEntity);

   factory QuizRepository.create() {
     return QuizRepositoryImpl();
   }
}