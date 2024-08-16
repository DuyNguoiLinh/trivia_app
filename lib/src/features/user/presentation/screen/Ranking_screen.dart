import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/ranking_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/ranking_widget/user_item.dart';

class RankingScreen extends ConsumerStatefulWidget {
  const RankingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RankingScreenState();
  }
}

  class _RankingScreenState extends ConsumerState<RankingScreen> {

  final PagingController<int, UserEntity> _pagingController =
    PagingController(firstPageKey: 0);
  final _pageSize = 3;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      ref.read(rankingProvider.notifier).fetchPageUser(pageKey,_pageSize);
    });
  }

  @override
  Widget build(BuildContext context) {

    ref.listen<AsyncValue<List<UserEntity>>>(rankingProvider, (previous, next) {
      next.when(
        data: (newItems) {
          if(newItems.isNotEmpty){
            final isLastPage = newItems.length < _pageSize;
            if (isLastPage) {
              _pagingController.appendLastPage(newItems);

            } else {
              final nextPageKey = _pagingController.nextPageKey! + 1;
              _pagingController.appendPage(newItems, nextPageKey);
              print(nextPageKey);
            }
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
          itemBuilder: (context, item, index) => UserItem(userEntity: item),
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
