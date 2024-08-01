import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/screen/view_question_screen.dart';
import '../../../domain/entity/question_entity.dart';

class CategoriesLoveNotifier
    extends AutoDisposeAsyncNotifier<List<CategoryEntity>> {

  List<CategoryEntity> listCategoryLove = List<CategoryEntity>.empty(
      growable: true);
  Map<String,QuestionEntity> mapQuestion = {};

  final quizRepository = QuizRepository.create();

  StreamSubscription<List<CategoryEntity>>? _subscription;


  @override
  FutureOr<List<CategoryEntity>> build() async {
    // listCategoryLove = await quizRepository.getCategoryHasQuestion();

    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = quizRepository.watchCategoryLocal().listen(
            (categories) {
          //     sort
          state = AsyncValue.data(categories);
        }, onError: (err,stackTr){
      state= AsyncValue.error(err,stackTr);
    }
    );

    return listCategoryLove;
  }

  Future<void> pickQuestion(QuestionEntity question) async {
    if(mapQuestion.containsKey(question.id)){

      mapQuestion.remove(question.id);
      ref.read(amountPickProvider.notifier).state--;
    } else {
      mapQuestion[question.id] =question;
      ref.read(amountPickProvider.notifier).state++;
    }
    print(mapQuestion.length);
  }

  List<QuestionEntity> getListQuestion() {
    return mapQuestion.values.toList();
  }


  //  delete question by id
  Future<void> deleteQuestion(String idQuestion,int idCategory) async{
     await quizRepository.deleteQuestion(idQuestion,idCategory);
  }

  // delete all question
  Future<void> deleteAllQuestion(int idCategory) async{
    await quizRepository.deleteAllQuestionByIdCategory(idCategory);
  }

}

final listCategoryLoveProvider = AsyncNotifierProvider.autoDispose<
    CategoriesLoveNotifier,
    List<CategoryEntity>>(() => CategoriesLoveNotifier());

