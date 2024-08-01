import 'package:flutter_riverpod/flutter_riverpod.dart';

// selected question
final currentIdSelectedProvider = StateProvider.autoDispose<String>((ref) => "");

//  use answer_button A,B,C
final answerProvider = Provider.family.autoDispose<String,int>((ref,index) {
  switch (index) {
    case 0 :
      return 'A';
    case 1:
      return 'B';
    case 2:
      return 'C';
    case 3:
      return 'D';
    default :
      return 'X';
  }
});

final isSaveProvider=StateProvider.family<bool,String>((ref,id) => false);
