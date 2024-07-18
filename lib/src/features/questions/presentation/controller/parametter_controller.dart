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
    state={...parameter};
    print(parameter);
  }
  Map<String, dynamic> getParameter() {
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
