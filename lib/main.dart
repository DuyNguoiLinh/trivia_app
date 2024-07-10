import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/quiz.dart';

void main() {
  runApp(const ProviderScope(child: Quiz()));
}

