import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/quiz_respository.dart';

final getInfoProvider =FutureProvider<String>((ref) async{
  final quizRepository= QuizRepository.create();
    final userNameInfo =await quizRepository.getInfoUser();
    return userNameInfo.isNotEmpty ? userNameInfo : "";
});