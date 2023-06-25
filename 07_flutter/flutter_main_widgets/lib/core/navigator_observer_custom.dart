import 'package:flutter/material.dart';

class NavigatorObserverCustom extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

    print(
        'Saindo da página ${route.settings.name} e indo para a página ${previousRoute?.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    print(
      'Saindo da página ${previousRoute?.settings.name} e indo para a página ${route.settings.name}',
    );
  }
}
