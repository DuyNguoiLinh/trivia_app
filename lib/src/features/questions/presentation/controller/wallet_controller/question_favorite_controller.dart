import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';

class AmountNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<QuestionEntity>,int> {

  List<QuestionEntity> listQuestion = List<QuestionEntity>.empty(
      growable: true);

  final quizRepository = QuizRepository.create();

  StreamSubscription<List<QuestionEntity>>? _subscription;


  @override
  FutureOr<List<QuestionEntity>> build(int idCategory) async {
    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = quizRepository.watchQuestionLocal(idCategory).listen(
            (questions) {

          state = AsyncValue.data(questions);
        }, onError: (err,stackTr){
         state= AsyncValue.error(err,stackTr);
    }
    );

    return listQuestion;
  }
}

final questionFavoriteProvider = AsyncNotifierProvider.family.autoDispose<
    AmountNotifier,List<QuestionEntity>,int>(() => AmountNotifier());

