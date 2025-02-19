import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/model_with_pagination.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/coin_history_controller.dart';
import '../../../domain/entity/coin_history_entity.dart';
import 'coin_history_item.dart';



class ListCoinHistories extends ConsumerStatefulWidget {
  const ListCoinHistories({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListCoinHistoriesState();
}

class _ListCoinHistoriesState extends ConsumerState<ListCoinHistories> {
  final PagingController<int, CoinHistoryEntity> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {

      if(pageKey != 0) {
        ref.read(coinHistoryProvider.notifier).fetchPage(pageKey);
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    ref.listen(coinHistoryProvider, (previous, next) {
    next.when(
      data: (newItems) {
          // final isLastPage = newItems.data.length < 5;

          if ( newItems.nextPageKey == null) {
            _pagingController.value = PagingState<int, CoinHistoryEntity>(
                nextPageKey: null,
                itemList: newItems.data);
          } else {
            _pagingController.value = PagingState<int, CoinHistoryEntity>(
                nextPageKey: newItems.nextPageKey,
                itemList: newItems.data);
          }
      },
      loading: () => {
        _pagingController.value = const PagingState<int, CoinHistoryEntity>(
            nextPageKey: null, itemList: [])
      },
      error: (error, stackTrace) {
        _pagingController.error = error;
      },
    );});

    return PagedListView<int, CoinHistoryEntity>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<CoinHistoryEntity>(
          itemBuilder: (context, item, index) => CoinHistoryItem(
            coinHistoryEntity: item,
            onPressed: () {
              ref.read(coinHistoryProvider.notifier).deleteCoinHistory(item.idTransaction);
            },
          ),
          firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator()),
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
