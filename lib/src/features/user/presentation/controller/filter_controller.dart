import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterWalletProvider =StateProvider.autoDispose<int>((ref) => 0);