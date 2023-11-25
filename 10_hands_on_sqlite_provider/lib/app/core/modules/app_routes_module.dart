import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class AppRoutesModule {
  final List<SingleChildWidget> _providers;
  final Map<String, WidgetBuilder> _routes;

  AppRoutesModule({
    required Map<String, WidgetBuilder> routes,
    required List<SingleChildWidget> providers,
  })  : _routes = routes,
        _providers = providers;

  Map<String, WidgetBuilder> get routes => _routes.map(
        (key, widgetBuilder) => MapEntry(
          key,
          (_) => MultiProvider(
            providers: _providers,
            child: Builder(
              builder: (context) => widgetBuilder(context),
            ),
          ),
        ),
      );

  Widget getPage(String path, BuildContext context) {
    final pageBuilder = _routes[path];

    if (pageBuilder == null) {
      throw Exception('Page not found');
    }

    return MultiProvider(
      providers: _providers,
      child: Builder(
        builder: (context) => pageBuilder(context),
      ),
    );
  }
}
