import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/screen/view_question_screen.dart';
import '../../../../user/presentation/controller/router_controller.dart';
import '../../../domain/entity/question_entity.dart';

class CategoriesLoveNotifier
    extends AutoDisposeAsyncNotifier<List<CategoryEntity>> {

  List<CategoryEntity> listCategoryLove = List<CategoryEntity>.empty(
      growable: true);
  Map<String,QuestionEntity> mapQuestion = {};

  final quizRepository = QuizRepository.create();

  StreamSubscription<List<CategoryEntity>>? _subscription;

 String _uid="";
  @override
  FutureOr<List<CategoryEntity>> build() async {

    final authState = ref.watch(authStateProvider);
    _uid = authState.asData?.value?.uid ?? '';

    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = quizRepository.watchCategoryLocal().listen(
            (categories) {

              categories.sort((a, b) => b.listQuestion!.length.compareTo(a.listQuestion!.length));

              state = AsyncValue.data(categories);
        }, onError: (err,stackTr){
      state= AsyncValue.error(err,stackTr);
    }
    );

    return listCategoryLove;
  }
  // pick question
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
  // toggle pick question
  bool togglePick(String idQuestion) {
    return mapQuestion.containsKey(idQuestion);
  }
  // get list question
  List<QuestionEntity> getListQuestion() {
    return mapQuestion.values.toList();
  }


  //  delete question by id
  Future<void> deleteQuestion(String idQuestion,int idCategory) async{
     await quizRepository.deleteQuestion(idQuestion,idCategory,_uid);
  }

  // delete all question
  Future<void> deleteAllQuestion(int idCategory) async{
    await quizRepository.deleteAllQuestionByIdCategory(idCategory,_uid);
  }

}

final listCategoryLoveProvider = AsyncNotifierProvider.autoDispose<
    CategoriesLoveNotifier,
    List<CategoryEntity>>(() => CategoriesLoveNotifier());

