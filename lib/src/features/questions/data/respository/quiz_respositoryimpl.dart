import 'package:trivia_app_with_flutter/src/features/questions/data/models/category_local.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_remote_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/respository/quiz_respository.dart';

class QuizRespositoryImpl implements QuizRespository {
  final localDataSource = QuizLocalDataSource.create();
  final remoteDataSourse = QuizRemoteDataSource.create();

  @override
  Future<void> saveUserName(String name) async {
    await localDataSource.saveUserName(name);
  }

  @override
  Future<List<QuestionEntity>> fetchQuestions(int amount, int idCategory,
      String? difficulty, String? type) async {
    try {
      final questionsResponse = await remoteDataSourse.getQuestions(
          amount, idCategory, difficulty, type);
      if (questionsResponse.isNotEmpty) {
        QuestionEntity.resetIdCounter();
        final listQuestions = questionsResponse.map((e) =>
            QuestionEntity.fromQuestionModel(e)).toList();
        return listQuestions;
      } else {
        return List.empty(growable: true);
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Future<List<CategoryEntity>> fetchCategories() async {
    try {
      final categoriesLocal = await localDataSource.getCategory();
      if (categoriesLocal.isNotEmpty) {
        final dataCategories = categoriesLocal.map((e) =>
            CategoryEntity.fromCategoryLocal(e)).toList();
        return dataCategories;
      } else {
        final dataCategories = await _fetchAndSaveCategories();
        return dataCategories;
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  Future<List<CategoryEntity>> _fetchAndSaveCategories() async {
    try {
      final categories = await remoteDataSourse.getCategories();
      if (categories.isNotEmpty) {
        final listCategories = categories.map((e) =>
            CategoryEntity.fromCategoryResponse(e)).toList();
        final categoryLocal = listCategories.map((e) =>
            CategoryLocal(idCategory: e.id,
                nameCategory: e.nameCategory,
                filterCategory: e.filterCategory)).toList();
        await localDataSource.saveCategory(categoryLocal);
        return listCategories;
      } else {
        return List.empty(growable: true);
      }
    } catch (err) {
      return Future.error(err);
    }
    Future<String> getInfoUser() async {
      try {
        final userNameInfo = await localDataSource.getInfoUser();
        return userNameInfo;
      } catch (err) {
        return Future.error(err);
      }
    }
    Future<void> deleteInfo() async {
      try {
        await localDataSource.deleteInfoUser();
      } catch (err) {
        return Future.error(err);
      }
    }
  }

  @override
  Future<void> deleteInfo() {
    // TODO: implement deleteInfo
    throw UnimplementedError();
  }

  @override
  Future<String> getInfoUser() {
    // TODO: implement getInfoUser
    throw UnimplementedError();
  }
}