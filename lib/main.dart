import 'package:andromo_test/app_theme.dart';
import 'package:andromo_test/internal/navigation/app_route.gr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRoutes = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRoutes.delegate(),
      routeInformationParser: _appRoutes.defaultRouteParser(),
      title: 'Andromo test',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
