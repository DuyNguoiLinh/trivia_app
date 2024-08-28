import '../../data/repository/quiz_respositoryimpl.dart';
import '../entity/category_entity.dart';
import '../entity/question_entity.dart';
import '../entity/result_entity.dart';

abstract class QuizRepository {
  Future<List<QuestionEntity>> fetchQuestions(
      int amount, int idCategory, String? difficulty, String? type);

  Future<List<CategoryEntity>> fetchCategories(String uid);

  Future<void> saveResultQuiz(ResultEntity resultEntity);

  Future<void> toggleSaveQuestion(
      QuestionEntity questionEntity, int idCategory, String nameCategory,String uid);

  Future<void> fetchAndSaveQuestionFavorite(String uid);


  Stream<List<CategoryEntity>> watchCategoryLocal();

  Stream<List<QuestionEntity>>  watchQuestionLocal(int idCategory,String uid);

  Future<void> addQuestionFavorite(QuestionEntity questionEntity,
      int idCategory, String nameCategory, String uid);

  Future<void> deleteQuestion(String idQuestion,int idCategory,String uid);

  Future<void> deleteAllQuestionByIdCategory(int idCateGory,String uid);

  factory QuizRepository.create() {
    return QuizRepositoryImpl();
  }
}
