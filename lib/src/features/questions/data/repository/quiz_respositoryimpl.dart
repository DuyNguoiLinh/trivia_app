import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_remote_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/result_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/firestore_data_source.dart';
import '../../../user/data/model/firebase_model/question_firestore_model.dart';
import '../../domain/repository/quiz_respository.dart';
import '../models/local/category_local.dart';
import '../models/local/question_local.dart';
import '../models/local/result_local.dart';

class QuizRepositoryImpl implements QuizRepository {

  final firestoreDataSource = FirestoreDataSource.create();
  final localDataSource = QuizLocalDataSource.create();
  final remoteDataSource = QuizRemoteDataSource.create();

  //  fetch question
  @override
  Future<List<QuestionEntity>> fetchQuestions(

      int amount, int idCategory, String? difficulty, String? type) async {
    try {

      final questionsResponse = await remoteDataSource.getQuestions(
          amount, idCategory, difficulty, type);

      if (questionsResponse.isNotEmpty) {
        final listQuestions = questionsResponse
            .map((e) => QuestionEntity.fromQuestionModel(e))
            .toList();

        return listQuestions;
      } else {

        return List.empty(growable: true);

      }
    } catch (err) {
      return Future.error(err);
    }
  }

  // fetch category
  @override
  Future<List<CategoryEntity>> fetchCategories(String uid) async {
    try {

      final categoriesLocal = await localDataSource.getCategories();

      if (categoriesLocal.isNotEmpty) {

        final dataCategories = categoriesLocal
            .map((e) => CategoryEntity.fromCategoryLocal(e))
            .toList();

        return dataCategories;

      } else {

        final dataCategories = await _fetchAndSaveCategories(uid);
        return dataCategories;

      }
    } catch (err) {
      return Future.error(err);
    }
  }

  //  get categories local or api
  Future<List<CategoryEntity>> _fetchAndSaveCategories(String uid) async {
    try {

      final categories = await remoteDataSource.getCategories();

      if (categories.isNotEmpty) {

        final listCategories = categories
            .map((e) => CategoryEntity.fromCategoryResponse(e))
            .toList();

        final categoryLocal = listCategories
            .map((e) => CategoryLocal(
                idCategory: e.id,
                nameCategory: e.nameCategory,
                filterCategory: e.filterCategory))
            .toList();

        await localDataSource.saveCategory(categoryLocal);
        await fetchAndSaveQuestionFavorite(uid);
        return listCategories;

      } else {

        return List.empty(growable: true);

      }
    } catch (err) {
      return Future.error(err);
    }
  }

  //   save result quiz into local
  @override
  Future<void> saveResultQuiz(ResultEntity resultEntity) async {
    try {

      final resultLocal = ResultLocal(
          idResult: resultEntity.id,
          total: resultEntity.total,
          completion: resultEntity.completion,
          correct: resultEntity.correct,
          wrong: resultEntity.wrong,
          coin: resultEntity.coin);

      await localDataSource.saveResultQuiz(resultLocal);

    } catch (err) {
      return Future.error(err);
    }
  }

  //   save question into Local
  @override
  Future<void> toggleSaveQuestion(QuestionEntity questionEntity, int idCategory,
      String nameCategory,String uid) async {

    final questionLocal = QuestionLocal(
      idQuestion: questionEntity.id,
      idCategory: idCategory,
      nameCategory: nameCategory,
      question: questionEntity.question,
      correctAnswer: questionEntity.correctAnswer,
      incorrectAnswers: questionEntity.incorrectAnswers,
      shuffleAnswer: questionEntity.shuffleAnswer!,
    );
    await  addQuestionFavorite(questionEntity, idCategory, nameCategory, uid);
    await localDataSource.toggleSaveQuestion(questionLocal,uid);
  }

//  watch  categories have question
  @override
  Stream<List<CategoryEntity>> watchCategoryLocal() {

    return localDataSource.watchCategories().map((listCategoryLocal) {

      final categoriesLocalHaveQuestion = listCategoryLocal
          .where((category) => category.questions.isNotEmpty)
          .toList();

      return categoriesLocalHaveQuestion
          .map((e) => CategoryEntity.fromCategoryLocal(e))
          .toList();

    });
  }

  // fetch question favorite
  @override
  Future<void> fetchAndSaveQuestionFavorite(String uid) async {
    final questionFromFirestore =
    await firestoreDataSource.fetchQuestionFavorite(uid);
    final questionFavorite = questionFromFirestore
        .map((e) => QuestionLocal.fromQuestionFirestore(e))
        .toList();

    await localDataSource.saveQuestionFavorite(questionFavorite, uid);
  }


//   watch questionLocal
  @override
  Stream<List<QuestionEntity>>  watchQuestionLocal(int idCategory,String uid) {

    return localDataSource.watchQuestionLocal(idCategory,uid).map((listQuestionLocal) {
      return listQuestionLocal.map((e) => QuestionEntity.fromQuestionLocal(e)).toList();
    });
  }


//   delete question by id
  @override
  Future<void> deleteQuestion(String idQuestion,int idCategory,String uid) async {
    try {

      await localDataSource.deleteQuestion(idQuestion,idCategory,uid);
      await firestoreDataSource.deleteQuestionFavorite(uid, idQuestion);

    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Future<void> addQuestionFavorite(QuestionEntity questionEntity,
      int idCategory, String nameCategory, String uid) async {
    final question = QuestionFirestoreModel(
        id: questionEntity.id,
        idCategory: idCategory,
        nameCategory: nameCategory,
        question: questionEntity.question,
        correctAnswer: questionEntity.correctAnswer,
        incorrectAnswers: questionEntity.incorrectAnswers,
        shuffleAnswer: questionEntity.shuffleAnswer!);
    await firestoreDataSource.addQuestionFavorite(question, uid);
  }

//   delete all question
  @override
  Future<void> deleteAllQuestionByIdCategory(int idCateGory,String uid) async {
    try {
      await localDataSource.deleteAllQuestionByIdCategory(idCateGory,uid);
    } catch (err) {
      return Future.error(err);
    }
  }
}
