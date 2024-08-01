import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/wallet_controller/list_category_love_controller.dart';
import '../quiz_controller.dart';

class AsyncListQuestionNotifier extends AutoDisposeAsyncNotifier<List<QuestionEntity>> {
  @override
  FutureOr<List<QuestionEntity>> build() async{
    final indexType = ref.watch(typeSourceProvider);
    final idCategory=ref.watch(idCategoryProvider);
    switch (indexType) {
      case 0 :
        final questions = await ref.watch(quizProvider.future);
        return questions;
        break;
      case 1 :
        final categories =await ref.watch(listCategoryLoveProvider.future);
        for(final category in categories){
          if(category.id == idCategory){
            return category.listQuestion!;
          }
        }
        return List<QuestionEntity>.empty();
      default :
        return List<QuestionEntity>.empty();
    }
  }

}
final listQuestionProvider = AsyncNotifierProvider.autoDispose<AsyncListQuestionNotifier,List<QuestionEntity>>(() => AsyncListQuestionNotifier());

final typeSourceProvider=StateProvider<int>((ref) => 0);
final idCategoryProvider =StateProvider<int>((ref) => 0);