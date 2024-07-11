import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/question_model.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/models/questions_response.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_remote_data_source.dart';
const _baseUrl="https://opentdb.com/api.php";
class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  final Dio _dio = Dio();
  QuizRemoteDataSourceImpl(){
    _dio.options.baseUrl=_baseUrl;
  }
  @override
  Future<List<QuestionModel>> getQuestions(int amount, int idCategory, String? difficulty) async{
    try{
      final token=await _checkToken();
      final response=await _dio.get('',queryParameters:{
       'amount' : amount,
        'category' : idCategory,
        'difficulty' : difficulty,
        'token' :  token
      });
      final questionsResponse=QuestionsResponse.fromJson(response.data);
      if(questionsResponse.responseCode==0){
        return questionsResponse.results;
      } else{
        switch(questionsResponse.responseCode) {
          case 1:
            return Future.error(Exception('No Results: The API doesn\'t have enough questions for your query.'));
            break;
          case 2:
            return Future.error(Exception('Invalid Parameter: Arguments passed in aren\'t valid.'));
            break;
          case 3:
            return Future.error(Exception('Token Not Found: Session token does not exist.'));
            break;
          case 4:
            return Future.error(Exception('Token Empty: Session token has returned all possible questions for the specified query.'));
            break;
          case 5:
            return Future.error(Exception('Rate Limit: Too many requests have occurred. Please wait and try again.'));
            break;
          default:  throw Exception('Failed to load API response')  ;
        }
      }

    } on DioException catch (e) {
      return Future.error(Exception(e));
    }
  }
  Future<String>  _checkToken() async{
    String token= await _getToken();
    if(token.isNotEmpty){
      return token;
    } else{
      token = await _resetToken();
      return token;
    }
  }
  Future<String> _getToken() async {
    try{
      final response= await _dio.get('?command=request');
      if(response.statusCode==200){
        final jsonResponse=response.data;
        return jsonResponse['token'];
      } else{
        throw Exception('Failed to retrieve session token');
      }
    } catch (err){
      return Future.error(err);
    }
  }
  Future<String> _resetToken() async {
    try{
      final currentToken=await _getToken();
      final response= await _dio.get('',queryParameters: {
        'command': 'reset',
        'token': currentToken,
      });
      if(response.statusCode==200){
        final jsonResponse=response.data;
        return jsonResponse['token'];
      } else{
        throw Exception('Failed to reset token');
      }
    } catch (err){
      return Future.error(err);
    }
  }
}