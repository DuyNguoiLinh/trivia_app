import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final iconPartDetailProvider = Provider.autoDispose<Map<String, IconData>>((ref) {
  return {
    'Completion': Icons.percent,
    'Total':  Icons.list,
    'Correct': Icons.check_circle,
    'Wrong': Icons.cancel,
  };
});
final colorPartDetailProvider = Provider.autoDispose<Map<String, Color>>((ref) {
  return {
    'Completion': Colors.blueAccent,
    'Total':  Colors.orange,
    'Correct':  Colors.lightGreen,
    'Wrong': Colors.red,

  };
});