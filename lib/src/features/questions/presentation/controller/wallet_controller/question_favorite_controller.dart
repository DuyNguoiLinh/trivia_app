import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/repository/quiz_respository.dart';

import '../../../../user/presentation/controller/router_controller.dart';

class AmountNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<QuestionEntity>,int> {

  List<QuestionEntity> listQuestion = List<QuestionEntity>.empty(
      growable: true);

  final quizRepository = QuizRepository.create();

  StreamSubscription<List<QuestionEntity>>? _subscription;

  String _uid="";

  @override
  FutureOr<List<QuestionEntity>> build(int idCategory) async {

    final authState = ref.watch(authStateProvider);
    _uid = authState.asData?.value?.uid ?? '';

    ref.onDispose(() {
      _subscription?.cancel();
    },);

    _subscription = quizRepository.watchQuestionLocal(idCategory,_uid).listen(
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

