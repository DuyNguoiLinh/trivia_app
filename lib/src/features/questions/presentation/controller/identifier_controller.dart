
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/question_controller.dart';

class AsyncIdentifierNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() {
    return 1;
  }
  Future<void> updateIdentifier() async{
    try{
      final asyncQuestion=await ref.watch(asyncQuestionProvider.future);
        if(asyncQuestion != null){
          print(asyncQuestion.id);
          state=AsyncValue.data(asyncQuestion.id);
        }
        } catch(err,stackTr){
         state=AsyncValue.error(err,stackTr);
         return Future.error(err,stackTr);
    }
  }
}
final asyncIdentifierProvider = AsyncNotifierProvider<AsyncIdentifierNotifier,int>(() {
  return AsyncIdentifierNotifier();
});