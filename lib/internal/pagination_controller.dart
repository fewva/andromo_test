import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

class PaginationController<TItem, TList extends List<TItem>> {
  final ReactiveList items = ReactiveList<TItem>();
  final RefreshController refreshController = RefreshController();
  final int itemCount;
  final int itemsPerPage;

  int get offset => items.length;
  PaginationController({this.itemsPerPage = 10, this.itemCount = 100});

  int get endIndex {
    var result = offset + itemsPerPage;
    if (result > itemCount) return itemCount;
    return result;
  }

  void addFromResponse(TList? response) {
    if (response == null || response.isEmpty) return;
    addAll(response);
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  void addAll(TList response) => items.addAll(response);

  void clear() => items.clear();
}
