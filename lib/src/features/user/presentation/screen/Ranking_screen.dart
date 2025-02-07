import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/widget/ranking_following.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/ranking_widget/ranking.dart';

// class RankingScreen extends ConsumerWidget {
//   const RankingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Center(child: Text('Leaderboard',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
//      ),
//      body: const Ranking(),
//    );
//   }
//
// }

class RankingScreen extends ConsumerStatefulWidget {
  const RankingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RankingScreenState();
  }
}

class _RankingScreenState extends ConsumerState<RankingScreen>  with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Leaderboard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        )),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.redAccent,
              width: 3.0,
            ),
            insets: EdgeInsets.symmetric(horizontal: 130),
          ),
          labelStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black54,
          tabs: const [
            Tab(text: "All"),
            Tab(text: "Following"),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        Ranking(),
        RankingFollowing(),
      ]),
    );
  }
}
