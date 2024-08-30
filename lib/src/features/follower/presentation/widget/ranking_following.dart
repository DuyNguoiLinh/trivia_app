import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/ranking_widget/user_item.dart';

import '../controller/ranking_following_controller.dart';

class RankingFollowing extends ConsumerStatefulWidget {
  const RankingFollowing({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RankingFollowingState();
  }
}

class _RankingFollowingState extends ConsumerState<RankingFollowing> {

  final PagingController<int, UserEntity> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) async {
      if (pageKey != 0) {
        await ref.read(rankingFollowingProvider.notifier).fetchPageTopFollowing(pageKey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    ref.listen<AsyncValue<List<UserEntity>>>(rankingFollowingProvider, (previous, next) {
      next.when(
        data: (newItems) {
          if (newItems.isNotEmpty) {
            final isLastPage = newItems.length < 5;
            if (isLastPage) {
              _pagingController.appendLastPage(newItems);
            } else {
              final nextPageKey = _pagingController.nextPageKey! + 1;
              _pagingController.appendPage(newItems, nextPageKey);
            }
          } else {
            _pagingController.appendLastPage([]);
          }
        },
        loading: () => {},
        error: (error, stackTrace) {
          _pagingController.error = error;
        },
      );
    });

    return PagedListView<int, UserEntity>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<UserEntity>(
          itemBuilder: (context, item, index) => UserItem(
            userEntity: item,
            index: index + 1,
          ),
          firstPageProgressIndicatorBuilder: (context) => const SizedBox(),
          newPageProgressIndicatorBuilder: (context) =>
          const Center(child: CircularProgressIndicator()),
        ));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

}
