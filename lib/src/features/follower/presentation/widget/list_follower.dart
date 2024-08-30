import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/controller/list_follower_controller.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/widget/FollowerItem.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';


class ListFollower extends ConsumerStatefulWidget {
  const ListFollower({super.key, required this.userEntity, required this.type});

  final UserEntity userEntity;
  final String type;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListFollowerState();
}

class _ListFollowerState extends ConsumerState<ListFollower>
    with AutomaticKeepAliveClientMixin {


  final PagingController<int, UserEntity> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    final userEntity = widget.userEntity;
    _pagingController.addPageRequestListener((pageKey) {
      if (pageKey != 0) {
        ref.read(listFollowerProvider(
            (uid: widget.userEntity.uid, type: widget.type)).notifier)
            .fetchPageFollower(pageKey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    ref.listen(
        listFollowerProvider((uid: widget.userEntity.uid, type: widget.type)), (
        previous, next) {
      next.when(
        data: (newItems) {
          if (newItems.nextPageKey == null) {
            _pagingController.value = PagingState<int, UserEntity>(
                nextPageKey: null,
                itemList: newItems.data);
          } else {
            _pagingController.value = PagingState<int, UserEntity>(
                nextPageKey: newItems.nextPageKey,
                itemList: newItems.data);
          }
        },
        loading: () =>
        {
          _pagingController.value = const PagingState<int, UserEntity>(
              nextPageKey: null, itemList: [])
        },
        error: (error, stackTrace) {
          _pagingController.error = error;
        },
      );
    });

    return PagedListView<int, UserEntity>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<UserEntity>(
          itemBuilder: (context, item, index) {
            return FollowerItem(userEntity: item,type: widget.type,);
          },
          firstPageProgressIndicatorBuilder: (context) =>
          const Center(child: CircularProgressIndicator()),
          newPageProgressIndicatorBuilder: (context) =>
          const Center(child: CircularProgressIndicator()),
          // noItemsFoundIndicatorBuilder: (context)  => Center(child: ,)
        ));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
