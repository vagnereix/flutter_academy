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
          (context) => MultiProvider(
            providers: _providers,
            child: widgetBuilder(context),
          ),
        ),
      );
}
