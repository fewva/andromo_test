import 'package:andromo_test/internal/pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaginatedList extends StatelessWidget {
  const PaginatedList({
    required this.paginationController,
    required this.refreshController,
    required this.onLoading,
    required this.onRefresh,
    required this.child,
    Key? key,
  }) : super(key: key);

  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final RefreshController refreshController;
  final PaginationController paginationController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onRefresh: onRefresh,
      onLoading: onLoading,
      controller: paginationController.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      footer: CustomFooter(
        builder: (context, mode) {
          Widget body;
          if (paginationController.offset == paginationController.itemCount) {
            body = const Text('end of story :(');
          } else if (mode == LoadStatus.idle) {
            body = const Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = const CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("release to load more");
          } else {
            body = const Text("No more Data");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      child: child,
    );
  }
}
