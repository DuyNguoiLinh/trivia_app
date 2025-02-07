import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/follower/domain/entity/follower_entity.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/controller/amount_follower_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import '../widget/list_follower.dart';

class ListFollowerScreen extends ConsumerStatefulWidget {
  const ListFollowerScreen({super.key, required this.userEntity,required this.initialIndex});

  final UserEntity userEntity;
  final int initialIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListFollowerScreenState();
}

class _ListFollowerScreenState extends ConsumerState<ListFollowerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncAmount = ref.watch(
        amountFollowerProvider(widget.userEntity.uid));
    final followerEntity = asyncAmount.valueOrNull;


    if (followerEntity != null) {
      return Scaffold(
        appBar: AppBar(
          title: Container(
            margin: const EdgeInsets.symmetric(horizontal: 100),
            child: Text(
              widget.userEntity.userName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 3,
            labelStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(text: "Following  ${followerEntity.amountFollowing}"),
              Tab(text: "${followerEntity.amountFollower} Follower"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListFollower(
              userEntity: widget.userEntity,
              type: 'following',
            ),
            ListFollower(
              userEntity: widget.userEntity,
              type: 'follower',
            ),
          ],
        ),
      );
    } else {
      return const Center(child: LinearProgressIndicator());

    }
  }
}
