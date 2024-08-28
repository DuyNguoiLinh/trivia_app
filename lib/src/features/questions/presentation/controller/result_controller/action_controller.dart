import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// button action provider
final notReviewProvider=StateProvider.autoDispose<bool>((ref) => true);

// icon provider
final iconActionProvider = Provider.autoDispose<Map<String, IconData>>((ref) {
  return {
    'Play again': Icons.replay,
    'Review Answer':  Icons.remove_red_eye,
    'Share': Icons.share,
    'Screenshot': Icons.camera_alt,
    'Home': Icons.home,
    'Continue': Icons.refresh,
  };
});

//  color action provider
final colorActionProvider = Provider.autoDispose<Map<String, Color>>((ref) {
  return {
    'Play again': Colors.blueAccent,
    'Review Answer':  Colors.orange,
    'Share':  Colors.indigo,
    'Screenshot': Colors.greenAccent,
    'Home':  Colors.limeAccent,
    'Continue': Colors.grey,
  };
});