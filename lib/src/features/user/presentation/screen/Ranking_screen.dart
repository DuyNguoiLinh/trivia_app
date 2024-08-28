import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/ranking_widget/ranking.dart';

class RankingScreen extends ConsumerWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Scaffold(
     appBar: AppBar(
       title: const Center(child: Text('Leaderboard',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
     ),
     body: const Ranking(),
   );
  }

}