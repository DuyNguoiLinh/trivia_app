import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/wallet_controller/question_favorite_controller.dart';
import '../home_controller/category_controller.dart';
import '../quiz_controller.dart';

class AsyncListQuestionNotifier extends AutoDisposeAsyncNotifier<List<QuestionEntity>> {

  @override
  FutureOr<List<QuestionEntity>> build() async{

    final indexType = ref.watch(typeSourceProvider);
    final idCategory=ref.watch(idCategoryProvider);

    switch (indexType) {
      case 0 :
        final questions = await ref.watch(questionApiProvider.future);
        return questions;

      case 1 :
        final questions =await ref.watch(questionFavoriteProvider(idCategory).future);
        return questions;
      default :
        return List<QuestionEntity>.empty();
    }
  }


}
final listQuestionProvider = AsyncNotifierProvider.autoDispose<AsyncListQuestionNotifier,List<QuestionEntity>>(() => AsyncListQuestionNotifier());

final typeSourceProvider=StateProvider<int>((ref) => 0);
