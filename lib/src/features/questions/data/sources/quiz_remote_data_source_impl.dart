import 'package:dio/dio.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_remote_data_source.dart';
import '../models/remote/categories_response.dart';
import '../models/remote/category_response.dart';
import '../models/remote/question_model.dart';
import '../models/remote/questions_response.dart';


const _baseUrl="https://opentdb.com/api.php";
const _baseUrlToken="https://opentdb.com/api_token.php";
const _baseUrlCategory='https://opentdb.com/api_category.php';

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {

  final Dio _dio = Dio();
  late String _token ;

  QuizRemoteDataSourceImpl();

  @override
  Future<List<QuestionModel>> getQuestions(int amount,int idCategory, String? difficulty, String? type) async{
    try{
      _token=await _getToken();
      final token =await _checkToken(_token);
      final queryParameters = <String, dynamic>{
        'amount': amount,
        'category': idCategory,
        if (difficulty != null) 'difficulty': difficulty.toLowerCase(),
        if (type != null) 'type': type,
        'token' : token,
      };

      final response=await _dio.get('$_baseUrl',queryParameters: queryParameters);

      final questionsResponse=QuestionsResponse.fromJson(response.data);

      if(questionsResponse.responseCode==0){
        return questionsResponse.results;
      } else{
        switch(questionsResponse.responseCode) {
          case 1:
            return Future.error(Exception('No Results: The API doesn\'t have enough questions for your query.'));
          case 2:
            return Future.error(Exception('Invalid Parameter: Arguments passed in aren\'t valid.'));
          case 3:
            return Future.error(Exception('Token Not Found: Session token does not exist.'));
          case 4:
            return Future.error(Exception('Token Empty: Session token has returned all possible questions for the specified query.'));
          case 5:
            return Future.error(Exception('Rate Limit: Too many requests have occurred. Please wait and try again.'));
          default:  throw Exception('Failed to load API response')  ;
        }
      }

    } on DioException catch (e) {
      return Future.error(Exception(e));
    }
  }

  // check token
  Future<String>  _checkToken(String token) async{
    if(token.isNotEmpty == true){
      return token;
    } else{
     final newToken = await _resetToken(token);
      return newToken;
    }
  }

  // get token
  Future<String> _getToken() async {
    try{
      final response= await _dio.get('$_baseUrlToken?command=request');
      final jsonResponse=response.data;
      if(jsonResponse['response_code'] == 0){
        return jsonResponse['token'];
      } else{
        throw Exception('Failed to retrieve session token');
      }
    } catch (err){
      return Future.error(err);
    }
  }

  // reset token
  Future<String> _resetToken(String tokenCurrent) async {
    try{
      final response= await _dio.get('$_baseUrlToken',queryParameters: {
        'command': 'reset',
        'token': tokenCurrent,
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

  // fetch Api Category
  @override
  Future<List<CategoryResponse>> getCategories() async{
    try{
       final response = await _dio.get('https://opentdb.com/api_category.php');
       final categoriesResponse = CategoriesResponse.fromJson(response.data);
       return categoriesResponse.triviaCategories;
    } on DioException catch (e) {
      return Future.error(Exception(e));
    }
  }
}