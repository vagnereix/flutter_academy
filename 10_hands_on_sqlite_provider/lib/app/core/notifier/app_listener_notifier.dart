import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../ui/messages.dart';
import 'app_change_notifier.dart';

class AppListenerNotifier {
  final AppChangeNotifier changeNotifier;

  AppListenerNotifier({required this.changeNotifier});

  void listen({
    required BuildContext context,
    required AppListenerNotifierCallback successCallback,
    AppListenerErrorNotifierCallback? errorCallback,
  }) {
    changeNotifier.addListener(() {
      if (changeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }

      if (changeNotifier.success) {
        successCallback(changeNotifier, this);
      } else if (changeNotifier.hasError) {
        if (errorCallback != null) errorCallback(changeNotifier, this);

        Messages.of(context).showError(changeNotifier.error ?? 'Erro interno');
      }
    });
  }
}

typedef AppListenerNotifierCallback = void Function(
  AppChangeNotifier changeNotifier,
  AppListenerNotifier appListenerNotifier,
);

typedef AppListenerErrorNotifierCallback = void Function(
  AppChangeNotifier changeNotifier,
  AppListenerNotifier appListenerNotifier,
);
