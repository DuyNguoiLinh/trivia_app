import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_remote_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/respository/quiz_respository.dart';

class QuizRespositoryImpl implements QuizRespository{
    final localDataSource=QuizLocalDataSource.create();
    final remoteDataSourse=QuizRemoteDataSource.create();
    @override
  Future<void> saveUserName(String name) async{
      await localDataSource.saveUserName(name);
    }
  @override
  Future<List<QuestionEntity>> fetchQuestions(int amount, int idCategory, String? difficulty) async{
      try{
        final questionsResponse= await remoteDataSourse.getQuestions(amount, idCategory, difficulty);
       if(questionsResponse.isNotEmpty){
         final listQuestions=questionsResponse.map((e) => QuestionEntity.fromQuestionModel(e)).toList();
         return listQuestions;
       } else{
         return List.empty(growable: true);
       }
        } catch (err){
        return Future.error(err);
      }
  }
  @override
  Future<List<CategoryEntity>> fetchCategories() async{
      try{
           final categories= await remoteDataSourse.getCategories();
           if(categories.isNotEmpty) {
             final listCategories=categories.map((e) => CategoryEntity.fromCategoryResponse(e)).toList();
             return listCategories;
           } else{
             return List.empty(growable: true);
           }
      } catch (err){
        return Future.error(err);
      }
  }
}