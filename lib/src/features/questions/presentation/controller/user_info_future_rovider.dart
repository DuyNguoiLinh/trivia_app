import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/respository/quiz_respository.dart';

final getInfoProvider =FutureProvider<String>((ref) async{
  final quizRespository= QuizRespository.create();
    final userNameInfo =await quizRespository.getInfoUser();
    return userNameInfo.isNotEmpty ? userNameInfo : "";
});