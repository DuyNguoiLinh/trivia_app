import 'package:flutter_riverpod/flutter_riverpod.dart';


final parameterProvider =
    StateNotifierProvider.autoDispose<ParameterNotifier, Map<String, dynamic>>((ref) {
     return ParameterNotifier();
});

//  user home and option screen

class ParameterNotifier extends StateNotifier<Map<String, dynamic>> {
  ParameterNotifier() : super({});

  final Map<String, dynamic> parameter = {};

  // Use map
  void addParameter(String key, dynamic value) {
    parameter[key] = value;
    state={...parameter};
    print(parameter);
  }

  //  check option
  bool checkParameter() {
    return parameter.containsKey('difficulty') &&
        parameter.containsKey('type') &&
        parameter.containsKey('amount') ;

  }


}
