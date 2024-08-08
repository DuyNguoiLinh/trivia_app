// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:trivia_app_with_flutter/src/features/user/domain/entity/coin_history_entity.dart';
// import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/coin_history_controller.dart';
// import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/wallet_widget/coin_history_item.dart';
//
// class ListCoinHistory extends ConsumerStatefulWidget {
//   const ListCoinHistory({super.key});
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() {
//   }
//
//   Widget build(BuildContext context, WidgetRef ref) {
//     //
//     // final PagingController<int,
//     //     CoinHistoryEntity> _pagingController = PagingController(
//     //     firstPageKey: 0);
//     final pagingController = ref.watch(pagingControllerProvider);
//
//     pagingController.addPageRequestListener((nextPageKey) {
//       ref.read(coinHistoryProvider.notifier).fetchPage(nextPageKey);
//     });
//
//     ref.listen<AsyncValue<List<CoinHistoryEntity>>>(coinHistoryProvider, (previous, next) {
//       next.when(
//         data: (newItems) {
//           if(newItems.isNotEmpty){
//             final isLastPage = newItems.length < 5;
//             if (isLastPage) {
//               pagingController.appendLastPage(newItems);
//
//             } else {
//               final nextPageKey = pagingController.nextPageKey! + newItems.length;
//               pagingController.appendPage(newItems, nextPageKey);
//               print(nextPageKey);
//             }
//           }
//
//         },
//         loading: () => {},
//         error: (error, stackTrace) {
//           pagingController.error = error;
//         },
//       );
//     });
//     return PagedListView<int, CoinHistoryEntity>(
//         pagingController: pagingController,
//
//         builderDelegate: PagedChildBuilderDelegate<CoinHistoryEntity>(
//             itemBuilder: (context, item, index) =>
//                 CoinHistoryItem(coinHistoryEntity: item),
//             newPageProgressIndicatorBuilder:  (context) => const Center(child: CircularProgressIndicator()),
//
//     )
//     );
//
//   }
//
//
// }
