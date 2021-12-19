import 'package:andromo_test/internal/pagination_controller.dart';
import 'package:andromo_test/internal/services/photo_list_service.dart';
import 'package:stacked/stacked.dart';

class PhotoListViewModel extends BaseViewModel {
  final _service = PhotoListService();

  final PaginationController paginationController =
      PaginationController(itemCount: PhotoListService.imageCount);

  List get items => paginationController.items;

  void onReady() => onLoading();

  void onLoading() async {
    var result = await _getImages();
    if (result == null) return;
    paginationController.addFromResponse(result);
    notifyListeners();
  }

  void onRefresh() {
    paginationController.clear();
    onLoading();
  }

  Future<List<String>?>? _getImages() async => await _service.getImages(
        startIndex: paginationController.offset,
        endIndex: paginationController.endIndex,
      );
}
