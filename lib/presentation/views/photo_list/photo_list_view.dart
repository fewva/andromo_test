import 'package:andromo_test/internal/navigation/app_route.gr.dart';
import 'package:andromo_test/presentation/shared/paginated_list.dart';
import 'package:andromo_test/presentation/views/photo_list/photo_list_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:auto_route/auto_route.dart';

class PhotoListView extends StatelessWidget {
  const PhotoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Images')),
      body: ViewModelBuilder<PhotoListViewModel>.reactive(
        viewModelBuilder: () => PhotoListViewModel(),
        onModelReady: (viewModel) => viewModel.onLoading(),
        builder: (context, viewModel, child) {
          return PaginatedList(
            onRefresh: viewModel.onRefresh,
            onLoading: viewModel.onLoading,
            refreshController: viewModel.paginationController.refreshController,
            paginationController: viewModel.paginationController,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: viewModel.paginationController.items.length,
              itemBuilder: (context, index) {
                var item = index != 3
                    ? viewModel.paginationController.items[index]
                    : 'error image';

                return GestureDetector(
                  onTap: () =>
                      AutoRouter.of(context).push(PhotoViewRoute(image: item)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: item,
                    errorWidget: (_, __, ___) {
                      return const IgnorePointer(
                        ignoring: true,
                        child: Center(child: Text('ERROR')),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
