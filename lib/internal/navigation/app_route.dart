import 'package:andromo_test/presentation/views/photo_list/photo_list_view.dart';
import 'package:andromo_test/presentation/views/photo_view/photo_view.dart';
import 'package:auto_route/annotations.dart';

@AdaptiveAutoRouter(
  preferRelativeImports: true,
  routes: [
    AutoRoute(
      initial: true,
      fullscreenDialog: true,
      page: PhotoListView,
    ),
    AutoRoute(page: PhotoView),
  ],
)
class $AppRouter {} 

// flutter packages pub run build_runner build  
