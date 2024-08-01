import '../../data/repository/quiz_respositoryimpl.dart';
import '../entity/category_entity.dart';
import '../entity/question_entity.dart';
import '../entity/result_entity.dart';

abstract class QuizRepository {
  Future<List<QuestionEntity>> fetchQuestions(
      int amount, int idCategory, String? difficulty, String? type);

  Future<List<CategoryEntity>> fetchCategories();

  Future<void> saveResultQuiz(ResultEntity resultEntity);

  Future<void> toggleSaveQuestion(
      QuestionEntity questionEntity, int idCategory, String nameCategory);

  // Future<List<CategoryEntity>> getCategoryHasQuestion();

  Stream<List<CategoryEntity>> watchCategoryLocal();

  Stream<List<QuestionEntity>>  watchQuestionLocal(int idCategory);

  Future<void> deleteQuestion(String idQuestion,int idCategory);

  Future<void> deleteAllQuestionByIdCategory(int idCateGory);

  factory QuizRepository.create() {
    return QuizRepositoryImpl();
  }
}
