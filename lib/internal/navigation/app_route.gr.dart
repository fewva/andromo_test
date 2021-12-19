// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

import '../../presentation/views/photo_list/photo_list_view.dart' as _i1;
import '../../presentation/views/photo_view/photo_view.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    PhotoListViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.PhotoListView(),
          fullscreenDialog: true);
    },
    PhotoViewRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoViewRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.PhotoView(image: args.image, key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(PhotoListViewRoute.name, path: '/'),
        _i3.RouteConfig(PhotoViewRoute.name, path: '/photo-view')
      ];
}

/// generated route for [_i1.PhotoListView]
class PhotoListViewRoute extends _i3.PageRouteInfo<void> {
  const PhotoListViewRoute() : super(name, path: '/');

  static const String name = 'PhotoListViewRoute';
}

/// generated route for [_i2.PhotoView]
class PhotoViewRoute extends _i3.PageRouteInfo<PhotoViewRouteArgs> {
  PhotoViewRoute({required String image, _i5.Key? key})
      : super(name,
            path: '/photo-view',
            args: PhotoViewRouteArgs(image: image, key: key));

  static const String name = 'PhotoViewRoute';
}

class PhotoViewRouteArgs {
  const PhotoViewRouteArgs({required this.image, this.key});

  final String image;

  final _i5.Key? key;
}
