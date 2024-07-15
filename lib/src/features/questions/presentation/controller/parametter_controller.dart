import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final parameterProvider =
    StateNotifierProvider<ParameterNotifier, Map<String, dynamic>>((ref) {
  return ParameterNotifier();
});

class ParameterNotifier extends StateNotifier<Map<String, dynamic>> {
  ParameterNotifier() : super({});
  final Map<String, dynamic> parameter = {};

  // Use map
  void addParameter(String key, dynamic value) {
    parameter[key] = value;
    print(parameter);
  }

  Map<String, dynamic> getParameter() {
    if (parameter['amount'] == '10 Question') {
      parameter['amount'] = 10;
    } else {
      parameter['amount'] = 5;
    }
    if (parameter['type'] == 'Multiple choice') {
      parameter['type'] = 'multiple';
    } else if (parameter['type'] == 'True/False') {
      parameter['type'] = 'boolean';
    } else {
      parameter['type'] = null;
    }
    if (parameter['difficulty'] == 'Random') {
      parameter['difficulty'] = null;
    }
    print(parameter);
    return parameter;
  }
  //  check option
  bool checkParameter() {
    if (parameter.containsKey('difficulty') &&
        parameter.containsKey('type') &&
        parameter.containsKey('amount')) {
      return true;
    } else{
      return false;
    }
  }
}
