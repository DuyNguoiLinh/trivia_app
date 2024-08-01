import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';

class AsyncAmountNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<QuestionEntity>,CategoryEntity> {

  List<QuestionEntity> listQuestion = List<QuestionEntity>.empty(
      growable: true);

  final quizRepository = QuizRepository.create();

  StreamSubscription<List<QuestionEntity>>? _subscription;


  @override
  FutureOr<List<QuestionEntity>> build(CategoryEntity arg) async {
    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = quizRepository.watchQuestionLocal().listen(
            (questions) {
              listQuestion=[];
              for(final question  in questions){
                if(question.idCategory == arg.id){
                  listQuestion.add(question);
                }
              }
          state = AsyncValue.data(listQuestion);
        }, onError: (err,stackTr){
         state= AsyncValue.error(err,stackTr);
    }
    );

    return listQuestion;
  }
}

final amountQuestionProvider = AsyncNotifierProvider.family.autoDispose<
    AsyncAmountNotifier,List<QuestionEntity>,CategoryEntity>(() => AsyncAmountNotifier());

