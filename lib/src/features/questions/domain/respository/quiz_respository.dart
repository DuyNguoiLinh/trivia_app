import 'package:trivia_app_with_flutter/src/features/questions/data/respository/quiz_respositoryimpl.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source_impl.dart';

abstract class QuizRespository{
  Future<void> saveUserName(String name);
   factory QuizRespository.create() {
     return QuizRespositoryimpl();
   }
}