import 'package:flutter_riverpod/flutter_riverpod.dart';
//  use answer_button A,B,C
final answerProvider = Provider.family.autoDispose<String,int>((ref,index) {
  switch (index) {
    case 0 :
      return 'A';
      break;
    case 1:
      return 'B';
      break;
    case 2:
      return 'C';
      break;
    case 3:
      return 'D';
      break;
    default :
      return 'X';
  }
});